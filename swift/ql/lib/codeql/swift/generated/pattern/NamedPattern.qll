// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.pattern.Pattern
import codeql.swift.elements.decl.VarDecl

module Generated {
  class NamedPattern extends Synth::TNamedPattern, Pattern {
    override string getAPrimaryQlClass() { result = "NamedPattern" }

    /**
     * Gets the variable declaration of this named pattern.
     */
    VarDecl getVarDecl() {
      result =
        Synth::convertVarDeclFromRaw(Synth::convertNamedPatternToRaw(this)
              .(Raw::NamedPattern)
              .getVarDecl())
    }
  }
}
