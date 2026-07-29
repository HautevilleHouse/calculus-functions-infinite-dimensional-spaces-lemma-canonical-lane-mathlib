import CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def calculusFunctionsProjection : Projection CalculusFunctionsEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem calculus_functions_projection_idempotent (x : CalculusFunctionsEndgameState) :
    calculusFunctionsProjection.toFun (calculusFunctionsProjection.toFun x) = calculusFunctionsProjection.toFun x := by
  exact calculusFunctionsProjection.idempotent x

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse