// generated by codegen/codegen.py
import codeql.swift.elements.pattern.Pattern

class ParenPatternBase extends @paren_pattern, Pattern {
  override string getPrimaryQlClass() { result = "ParenPattern" }

  Pattern getSubPattern() {
    exists(Pattern x |
      paren_patterns(this, x) and
      result = x.resolve()
    )
  }
}
