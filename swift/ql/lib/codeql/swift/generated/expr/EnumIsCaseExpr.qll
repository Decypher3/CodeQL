// generated by codegen/codegen.py
import codeql.swift.elements.decl.EnumElementDecl
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.typerepr.TypeRepr

class EnumIsCaseExprBase extends @enum_is_case_expr, Expr {
  override string getPrimaryQlClass() { result = "EnumIsCaseExpr" }

  Expr getSubExpr() {
    exists(Expr x |
      enum_is_case_exprs(this, x, _, _) and
      result = x.resolve()
    )
  }

  TypeRepr getTypeRepr() {
    exists(TypeRepr x |
      enum_is_case_exprs(this, _, x, _) and
      result = x.resolve()
    )
  }

  EnumElementDecl getElement() {
    exists(EnumElementDecl x |
      enum_is_case_exprs(this, _, _, x) and
      result = x.resolve()
    )
  }
}
