// generated by codegen/codegen.py
import codeql.swift.elements.expr.ApplyExpr

class BinaryExprBase extends @binary_expr, ApplyExpr {
  override string getPrimaryQlClass() { result = "BinaryExpr" }
}
