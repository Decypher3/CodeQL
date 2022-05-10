// generated by codegen/codegen.py
import codeql.swift.elements.expr.Expr

class OneWayExprBase extends @one_way_expr, Expr {
  override string getPrimaryQlClass() { result = "OneWayExpr" }

  Expr getSubExpr() {
    exists(Expr x |
      one_way_exprs(this, x) and
      result = x.resolve()
    )
  }
}
