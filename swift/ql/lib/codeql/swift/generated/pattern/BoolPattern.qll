// generated by codegen/codegen.py
import codeql.swift.elements.pattern.Pattern

class BoolPatternBase extends @bool_pattern, Pattern {
  override string getPrimaryQlClass() { result = "BoolPattern" }

  boolean getValue() { bool_patterns(this, result) }
}
