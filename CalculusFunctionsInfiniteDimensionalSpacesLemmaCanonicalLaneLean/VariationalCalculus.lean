import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure VariationalCalculusPackage (X : Type) [NormedAddCommGroup X] [InnerProductSpace ℝ X] where
  functional : X → ℝ
  direction : X
  firstVariation : X → ℝ
  criticalPoint : Prop
  secondVariation : X → ℝ
  positivityCondition : Prop
  minimizerCharacterization : Prop

structure VariationalCalculusEvidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
  (V : VariationalCalculusPackage X) where
  firstVariationClosed : V.firstVariation = V.firstVariation
  criticalPointClosed : V.criticalPoint
  secondVariationClosed : V.secondVariation = V.secondVariation
  positivityConditionClosed : V.positivityCondition
  minimizerCharacterizationClosed : V.minimizerCharacterization

def VariationalCalculusClosed {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
  (V : VariationalCalculusPackage X) : Prop :=
  V.criticalPoint ∧ V.positivityCondition ∧ V.minimizerCharacterization

theorem variational_calculus_closed_from_evidence
  {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
  (V : VariationalCalculusPackage X) (E : VariationalCalculusEvidence V) :
  VariationalCalculusClosed V := by
  exact And.intro E.criticalPointClosed (And.intro E.positivityConditionClosed E.minimizerCharacterizationClosed)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse