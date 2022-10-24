// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Argument
import codeql.swift.elements.expr.Expr

module Generated {
  class ApplyExpr extends Synth::TApplyExpr, Expr {
    /**
     * Gets the function being applied.
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Expr getImmediateFunction() {
      result =
        Synth::convertExprFromRaw(Synth::convertApplyExprToRaw(this).(Raw::ApplyExpr).getFunction())
    }

    /**
     * Gets the function being applied.
     */
    final Expr getFunction() { result = getImmediateFunction().resolve() }

    /**
     * Gets the `index`th argument passed to the applied function (0-based).
     *
     * This includes nodes from the "hidden" AST. It can be overridden in subclasses to change the
     * behavior of both the `Immediate` and non-`Immediate` versions.
     */
    Argument getImmediateArgument(int index) {
      result =
        Synth::convertArgumentFromRaw(Synth::convertApplyExprToRaw(this)
              .(Raw::ApplyExpr)
              .getArgument(index))
    }

    /**
     * Gets the `index`th argument passed to the applied function (0-based).
     */
    final Argument getArgument(int index) { result = getImmediateArgument(index).resolve() }

    /**
     * Gets any of the arguments passed to the applied function.
     */
    final Argument getAnArgument() { result = getArgument(_) }

    /**
     * Gets the number of arguments passed to the applied function.
     */
    final int getNumberOfArguments() { result = count(getAnArgument()) }
  }
}
