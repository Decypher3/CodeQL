// generated by codegen/codegen.py
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.expr.LiteralExpr
import codeql.swift.elements.expr.OpaqueValueExpr
import codeql.swift.elements.expr.TapExpr

class InterpolatedStringLiteralExprBase extends @interpolated_string_literal_expr, LiteralExpr {
  override string getPrimaryQlClass() { result = "InterpolatedStringLiteralExpr" }

  OpaqueValueExpr getInterpolationExpr() {
    exists(OpaqueValueExpr x |
      interpolated_string_literal_expr_interpolation_exprs(this, x) and
      result = x.resolve()
    )
  }

  predicate hasInterpolationExpr() { exists(getInterpolationExpr()) }

  Expr getInterpolationCountExpr() {
    exists(Expr x |
      interpolated_string_literal_expr_interpolation_count_exprs(this, x) and
      result = x.resolve()
    )
  }

  predicate hasInterpolationCountExpr() { exists(getInterpolationCountExpr()) }

  Expr getLiteralCapacityExpr() {
    exists(Expr x |
      interpolated_string_literal_expr_literal_capacity_exprs(this, x) and
      result = x.resolve()
    )
  }

  predicate hasLiteralCapacityExpr() { exists(getLiteralCapacityExpr()) }

  TapExpr getAppendingExpr() {
    exists(TapExpr x |
      interpolated_string_literal_expr_appending_exprs(this, x) and
      result = x.resolve()
    )
  }

  predicate hasAppendingExpr() { exists(getAppendingExpr()) }
}
