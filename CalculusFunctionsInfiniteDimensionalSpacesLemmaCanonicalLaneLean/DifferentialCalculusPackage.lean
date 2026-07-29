import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Calculus.FDeriv

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure DifferentialCalculusPackage {B : BanachSpacePackage} where
  domain : Set B.space
  codomain : Type u
  codomainNormedAddCommGroup : NormedAddCommGroup codomain
  codomainNormedSpace : NormedSpace ℝ codomain
  functionF : B.space → codomain
  differentiableAtEachPoint : Prop
  fderivContinuous : Prop
  chainRule : Prop
  inverseFunctionTheorem : Prop

structure DifferentialCalculusEvidence {B : BanachSpacePackage}
    (D : DifferentialCalculusPackage B) where
  differentiableAtEachPointClosed : D.differentiableAtEachPoint
  fderivContinuousClosed : D.fderivContinuous
  chainRuleClosed : D.chainRule
  inverseFunctionTheoremClosed : D.inverseFunctionTheorem

def DifferentialCalculusClosed {B : BanachSpacePackage}
    (D : DifferentialCalculusPackage B) : Prop :=
  D.differentiableAtEachPoint ∧ D.fderivContinuous ∧ D.chainRule ∧ D.inverseFunctionTheorem

theorem differential_calculus_closed_from_evidence
    {B : BanachSpacePackage} (D : DifferentialCalculusPackage B)
    (E : DifferentialCalculusEvidence D) : DifferentialCalculusClosed D := by
  exact And.intro E.differentiableAtEachPointClosed
    (And.intro E.fderivContinuousClosed
      (And.intro E.chainRuleClosed E.inverseFunctionTheoremClosed))

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse