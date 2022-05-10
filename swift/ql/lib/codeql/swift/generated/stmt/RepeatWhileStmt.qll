// generated by codegen/codegen.py
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.stmt.LabeledStmt
import codeql.swift.elements.stmt.Stmt

class RepeatWhileStmtBase extends @repeat_while_stmt, LabeledStmt {
  override string getPrimaryQlClass() { result = "RepeatWhileStmt" }

  Expr getCondition() {
    exists(Expr x |
      repeat_while_stmts(this, x, _) and
      result = x.resolve()
    )
  }

  Stmt getBody() {
    exists(Stmt x |
      repeat_while_stmts(this, _, x) and
      result = x.resolve()
    )
  }
}
