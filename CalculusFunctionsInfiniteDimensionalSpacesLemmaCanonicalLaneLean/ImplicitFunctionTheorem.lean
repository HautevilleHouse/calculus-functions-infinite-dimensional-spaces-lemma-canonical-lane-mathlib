import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean.InfiniteDimensionalCalculus

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure ImplicitFunctionTheoremPackage where
  mapping : SmoothFunction BanachSpace BanachSpace
  point : BanachSpace.carrier
  partialDerivativeInvertible : Prop
  localExistence : Prop
  uniqueness : Prop

structure ImplicitFunctionTheoremEvidence (P : ImplicitFunctionTheoremPackage) where
  partialDerivativeInvertibleClosed : P.partialDerivativeInvertible
  localExistenceClosed : P.localExistence
  uniquenessClosed : P.uniqueness

def ImplicitFunctionTheoremClosed (P : ImplicitFunctionTheoremPackage) : Prop :=
  P.partialDerivativeInvertible ∧ P.localExistence ∧ P.uniqueness

theorem implicit_function_theorem_closed_from_evidence (P : ImplicitFunctionTheoremPackage)
    (E : ImplicitFunctionTheoremEvidence P) : ImplicitFunctionTheoremClosed P := by
  exact And.intro E.partialDerivativeInvertibleClosed
    (And.intro E.localExistenceClosed E.uniquenessClosed)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse