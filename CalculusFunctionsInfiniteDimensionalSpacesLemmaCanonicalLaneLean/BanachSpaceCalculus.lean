import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure BanachSpaceCalculusPackage (X Y Z : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z] where
  additionContinuous : Prop
  scalarMultiplicationContinuous : Prop
  compositionContinuous : Prop
  chainRule : Prop
  productRule : Prop

structure BanachSpaceCalculusEvidence {X Y Z : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
  (C : BanachSpaceCalculusPackage X Y Z) where
  additionContinuousClosed : C.additionContinuous
  scalarMultiplicationContinuousClosed : C.scalarMultiplicationContinuous
  compositionContinuousClosed : C.compositionContinuous
  chainRuleClosed : C.chainRule
  productRuleClosed : C.productRule

def BanachSpaceCalculusClosed {X Y Z : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
  (C : BanachSpaceCalculusPackage X Y Z) : Prop :=
  C.additionContinuous ∧ C.scalarMultiplicationContinuous ∧ C.compositionContinuous ∧ C.chainRule ∧ C.productRule

theorem banach_space_calculus_closed_from_evidence
  {X Y Z : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
  (C : BanachSpaceCalculusPackage X Y Z) (E : BanachSpaceCalculusEvidence C) :
  BanachSpaceCalculusClosed C := by
  exact And.intro E.additionContinuousClosed (And.intro E.scalarMultiplicationContinuousClosed
    (And.intro E.compositionContinuousClosed (And.intro E.chainRuleClosed E.productRuleClosed)))

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse