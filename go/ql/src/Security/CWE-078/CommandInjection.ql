/**
 * @name Command built from user-controlled sources
 * @description Building a system command from user-controlled sources is vulnerable to insertion of
 *              malicious code by the user.
 * @kind path-problem
 * @problem.severity error
 * @security-severity 9.8
 * @precision high
 * @id go/command-injection
 * @tags security
 *       external/cwe/cwe-078
 */

import go
import semmle.go.security.CommandInjection

module Flow =
  DataFlow::MergePathGraph<CommandInjection::TaintConfiguration::PathNode,
    CommandInjection::DoubleDashSanitizing::PathNode,
    CommandInjection::TaintConfiguration::PathGraph,
    CommandInjection::DoubleDashSanitizing::PathGraph>;

import Flow::PathGraph

from Flow::PathNode source, Flow::PathNode sink
where
  CommandInjection::TaintConfiguration::flowPath(source.asPathNode1(), sink.asPathNode1()) or
  CommandInjection::DoubleDashSanitizing::flowPath(source.asPathNode2(), sink.asPathNode2())
select sink.getNode(), source, sink, "This command depends on a $@.", source.getNode(),
  "user-provided value"
