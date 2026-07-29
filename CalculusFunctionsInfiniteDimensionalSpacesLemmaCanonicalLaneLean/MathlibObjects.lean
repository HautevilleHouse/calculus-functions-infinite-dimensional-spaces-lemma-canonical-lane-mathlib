import CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CalculusFunctionsSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  vectorSpace : Module ℝ carrier
  normedSpace : NormedSpace ℝ carrier
  complete : CompleteSpace carrier
  infiniteDimension : InfiniteDimensional ℝ carrier

structure CalculusFunctionsAdmittedObject where
  space : CalculusFunctionsSpace
  differentiableStructure : Prop
  smoothStructure : Prop
  functionSpace : Type
  functionSpaceTopology : TopologicalSpace functionSpace
  boundedLinearFunctionalsSeparatePoints : Prop
  conclusion : boundedLinearFunctionalsSeparatePoints

structure CalculusFunctionsEndgameState where
  object : CalculusFunctionsAdmittedObject

def CalculusFunctionsWitnessClosed (O : CalculusFunctionsAdmittedObject) : Prop :=
  O.boundedLinearFunctionalsSeparatePoints

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse