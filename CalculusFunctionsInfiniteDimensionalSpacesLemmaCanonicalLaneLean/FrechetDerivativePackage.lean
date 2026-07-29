import HautevilleHouse.CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure FrechetDerivativePackage (E : InfiniteDimSpace) (F : InfiniteDimSpace) where
  domainNorm : E.norm
  codomainNorm : F.norm
  linearMapSpace : Type u
  boundedLinear : Prop
  derivativeDefined : Prop
  chainRuleHolds : Prop

structure FrechetDerivativeEvidence (E F : InfiniteDimSpace) (P : FrechetDerivativePackage E F) where
  boundedLinearClosed : P.boundedLinear
  derivativeDefinedClosed : P.derivativeDefined
  chainRuleHoldsClosed : P.chainRuleHolds

def FrechetDerivativeClosed (E F : InfiniteDimSpace) (P : FrechetDerivativePackage E F) : Prop :=
  P.boundedLinear ∧ P.derivativeDefined ∧ P.chainRuleHolds

theorem frechet_derivative_closed_from_evidence
    (E F : InfiniteDimSpace) (P : FrechetDerivativePackage E F)
    (Evi : FrechetDerivativeEvidence E F P) : FrechetDerivativeClosed E F P := by
  exact And.intro Evi.boundedLinearClosed
    (And.intro Evi.derivativeDefinedClosed Evi.chainRuleHoldsClosed)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse