import CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

def ConstrainedCalculusFunctionsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_calculus_functions_endgame (A : AdmissibleClass) :
    ConstrainedCalculusFunctionsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse