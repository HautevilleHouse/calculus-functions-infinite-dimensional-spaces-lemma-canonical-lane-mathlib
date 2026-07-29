import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean.FrechetDifferentiability
import HautevilleHouse.CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

def ConstrainedCalculusClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_calculus_endgame (A : AdmissibleClass) :
    ConstrainedCalculusClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse