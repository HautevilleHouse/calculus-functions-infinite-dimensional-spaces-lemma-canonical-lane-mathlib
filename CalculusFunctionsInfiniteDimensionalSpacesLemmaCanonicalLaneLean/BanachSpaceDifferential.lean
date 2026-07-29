import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure BanachSpacePackage where
  space : Type
  normedAddCommGroup : NormedAddCommGroup space
  normedSpace : NormedSpace ℝ space
  smooth : Prop
  reflexivity : Prop

structure FréchetDifferentiablePackage (B : BanachSpacePackage) where
  map : B.space → B.space
  derivativeDefined : Prop
  linearDerivative : Prop
  continuousDerivative : Prop

structure FréchetDifferentiableEvidence {B : BanachSpacePackage} (F : FréchetDifferentiablePackage B) where
  derivativeDefinedClosed : F.derivativeDefined
  linearDerivativeClosed : F.linearDerivative
  continuousDerivativeClosed : F.continuousDerivative

def FréchetDifferentiableClosed {B : BanachSpacePackage} (F : FréchetDifferentiablePackage B) : Prop :=
  F.derivativeDefined ∧ F.linearDerivative ∧ F.continuousDerivative

theorem frechet_differentiable_closed_from_evidence
    {B : BanachSpacePackage} (F : FréchetDifferentiablePackage B)
    (E : FréchetDifferentiableEvidence F) : FréchetDifferentiableClosed F := by
  exact And.intro E.derivativeDefinedClosed
    (And.intro E.linearDerivativeClosed E.continuousDerivativeClosed)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse