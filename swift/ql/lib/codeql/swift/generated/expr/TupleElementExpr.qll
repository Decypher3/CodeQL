// generated by codegen/codegen.py
import codeql.swift.elements.expr.Expr

class TupleElementExprBase extends @tuple_element_expr, Expr {
  override string getPrimaryQlClass() { result = "TupleElementExpr" }

  Expr getSubExpr() {
    exists(Expr x |
      tuple_element_exprs(this, x, _) and
      result = x.resolve()
    )
  }

  int getIndex() { tuple_element_exprs(this, _, result) }
}
