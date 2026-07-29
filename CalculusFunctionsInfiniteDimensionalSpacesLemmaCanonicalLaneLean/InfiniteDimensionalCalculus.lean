import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure BanachSpace where
  carrier : Type u
  norm : carrier → ℝ
  complete : Prop
  linear : Prop

structure FrechetDerivative (V W : BanachSpace) (f : V.carrier → W.carrier) where
  derivative : V.carrier → (V.carrier → W.carrier)
  linearIncrement : Prop
  bounded : Prop
  limitCondition : Prop
  derivativeExists : Prop

structure SmoothFunction (V W : BanachSpace) where
  func : V.carrier → W.carrier
  frechetDerivatives : List (FrechetDerivative V W func)
  allDerivativesExist : Prop
  continuity : Prop

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse