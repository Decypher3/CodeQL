/**
 * C++-specific implementation of range analysis.
 */

private import semmle.code.cpp.rangeanalysis.new.internal.semantic.Semantic
private import semmle.code.cpp.rangeanalysis.new.internal.semantic.analysis.FloatDelta
private import RangeAnalysisImpl
private import semmle.code.cpp.rangeanalysis.RangeAnalysisUtils
private import codeql.rangeanalysis.RangeAnalysis

module CppLangImplRelative implements LangSig<Sem, FloatDelta> {
  /**
   * Ignore the bound on this expression.
   *
   * This predicate is to keep the results identical to the original Java implementation. It should be
   * removed once we have the new implementation matching the old results exactly.
   */
  predicate ignoreExprBound(SemExpr e) {
    exists(boolean upper, float delta, ConstantBounds::SemZeroBound b, float lb, float ub |
      ConstantStage::semBounded(e, b, delta, upper, _) and
      typeBounds(e.getSemType(), lb, ub) and
      (
        upper = false and
        delta < lb
        or
        upper = true and
        delta > ub
      )
    )
  }

  private predicate typeBounds(SemType t, float lb, float ub) {
    exists(SemIntegerType integralType, float limit |
      integralType = t and limit = 2.pow(8 * integralType.getByteSize())
    |
      if integralType instanceof SemBooleanType
      then lb = 0 and ub = 1
      else
        if integralType.isSigned()
        then (
          lb = -(limit / 2) and ub = (limit / 2) - 1
        ) else (
          lb = 0 and ub = limit - 1
        )
    )
    or
    // This covers all floating point types. The range is (-Inf, +Inf).
    t instanceof SemFloatingPointType and lb = -(1.0 / 0.0) and ub = 1.0 / 0.0
  }

  /**
   * Holds if `e >= bound` (if `upper = false`) or `e <= bound` (if `upper = true`).
   */
  predicate hasConstantBound(SemExpr e, float bound, boolean upper) { none() }

  /**
   * Holds if `e >= bound + delta` (if `upper = false`) or `e <= bound + delta` (if `upper = true`).
   */
  predicate hasBound(SemExpr e, SemExpr bound, float delta, boolean upper) { none() }

  /**
   * Holds if the value of `dest` is known to be `src + delta`.
   */
  predicate additionalValueFlowStep(SemExpr dest, SemExpr src, float delta) { none() }

  /**
   * Gets the type that range analysis should use to track the result of the specified expression,
   * if a type other than the original type of the expression is to be used.
   *
   * This predicate is commonly used in languages that support immutable "boxed" types that are
   * actually references but whose values can be tracked as the type contained in the box.
   */
  SemType getAlternateType(SemExpr e) { none() }

  /**
   * Gets the type that range analysis should use to track the result of the specified source
   * variable, if a type other than the original type of the expression is to be used.
   *
   * This predicate is commonly used in languages that support immutable "boxed" types that are
   * actually references but whose values can be tracked as the type contained in the box.
   */
  SemType getAlternateTypeForSsaVariable(SemSsaVariable var) { none() }
}
