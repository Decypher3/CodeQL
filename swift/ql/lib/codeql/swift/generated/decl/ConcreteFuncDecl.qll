// generated by codegen/codegen.py
import codeql.swift.elements.decl.FuncDecl

class ConcreteFuncDeclBase extends @concrete_func_decl, FuncDecl {
  override string getPrimaryQlClass() { result = "ConcreteFuncDecl" }
}
