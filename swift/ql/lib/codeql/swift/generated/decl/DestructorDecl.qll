// generated by codegen/codegen.py
import codeql.swift.elements.decl.AbstractFunctionDecl

class DestructorDeclBase extends @destructor_decl, AbstractFunctionDecl {
  override string getPrimaryQlClass() { result = "DestructorDecl" }
}
