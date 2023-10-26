/**
 * Contains predicates for generating `summaryModel`s to summarize flow through methods.
 */

private import ruby
private import codeql.ruby.ApiGraphs
private import codeql.ruby.TaintTracking
private import Util as Util

/**
 * Contains predicates for generating `summaryModel`s to summarize flow through methods.
 */
module Summaries {
  private module Config implements DataFlow::ConfigSig {
    predicate isSource(DataFlow::Node source) {
      exists(DataFlow::MethodNode methodNode | methodNode.isPublic() |
        getAnyParameterNode(methodNode).asSource() = source
      )
    }

    predicate isSink(DataFlow::Node sink) { sink = any(DataFlow::MethodNode m).getAReturnNode() }
  }

  private API::Node getAnyParameterNode(DataFlow::MethodNode methodNode) {
    result.asSource() =
      [
        methodNode.getParameter(_), methodNode.getKeywordParameter(_),
        methodNode.getBlockParameter(), methodNode.getSelfParameter()
      ]
  }

  private module ValueFlow {
    import DataFlow::Global<Config>

    predicate summaryModel(string type, string path, string input, string output) {
      exists(DataFlow::MethodNode methodNode, API::Node paramNode |
        methodNode.getLocation().getFile() instanceof Util::RelevantFile and
        flow(paramNode.asSource(), methodNode.getAReturnNode()) and
        paramNode = getAnyParameterNode(methodNode)
      |
        Util::pathToMethod(methodNode, type, path) and
        input = Util::getArgumentPath(paramNode.asSource()) and
        output = "ReturnValue"
      )
    }
  }

  private module TaintFlow {
    import TaintTracking::Global<Config>

    predicate summaryModel(string type, string path, string input, string output) {
      not ValueFlow::summaryModel(type, path, input, output) and
      exists(DataFlow::MethodNode methodNode, API::Node paramNode |
        methodNode.getLocation().getFile() instanceof Util::RelevantFile and
        flow(paramNode.asSource(), methodNode.getAReturnNode()) and
        paramNode = getAnyParameterNode(methodNode)
      |
        Util::pathToMethod(methodNode, type, path) and
        input = Util::getArgumentPath(paramNode.asSource()) and
        output = "ReturnValue"
      )
    }
  }

  /**
   * Holds if in calls to `(type, path)`, the value referred to by `input`
   * can flow to the value referred to by `output`.
   *
   * `kind` should be either `value` or `taint`, for value-preserving or taint-preserving steps,
   * respectively.
   */
  predicate summaryModel(string type, string path, string input, string output, string kind) {
    ValueFlow::summaryModel(type, path, input, output) and kind = "value"
    or
    TaintFlow::summaryModel(type, path, input, output) and kind = "taint"
  }
}
