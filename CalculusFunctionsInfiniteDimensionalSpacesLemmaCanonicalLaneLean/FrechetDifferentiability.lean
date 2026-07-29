import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure FrechetDifferentiabilityPackage (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  domain : X
  codomain : Y
  linearOperator : X → Y
  boundedLinear : Prop
  limitExists : Prop
  derivativeAtPoint : Prop
  remainderCondition : Prop

structure FrechetDifferentiabilityEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (F : FrechetDifferentiabilityPackage X Y) where
  boundedLinearClosed : F.boundedLinear
  limitExistsClosed : F.limitExists
  derivativeAtPointClosed : F.derivativeAtPoint
  remainderConditionClosed : F.remainderCondition

def FrechetDifferentiabilityClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (F : FrechetDifferentiabilityPackage X Y) : Prop :=
  F.boundedLinear ∧ F.limitExists ∧ F.derivativeAtPoint ∧ F.remainderCondition

theorem frechet_differentiability_closed_from_evidence
  {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (F : FrechetDifferentiabilityPackage X Y) (E : FrechetDifferentiabilityEvidence F) :
  FrechetDifferentiabilityClosed F := by
  exact And.intro E.boundedLinearClosed (And.intro E.limitExistsClosed (And.intro E.derivativeAtPointClosed E.remainderConditionClosed))

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse