import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure DifferentiableStructurePackage where
  openSet : Type u
  chart : Type v
  atlas : Type w
  smoothCompatibility : Prop
  dimensionFinite : Prop
  structureAdmissible : Prop

structure DifferentiableStructureEvidence (D : DifferentiableStructurePackage) where
  smoothCompatibilityAdmissible : D.smoothCompatibility
  dimensionFiniteAdmissible : D.dimensionFinite

def DifferentiableStructureClosed (D : DifferentiableStructurePackage) : Prop :=
  D.smoothCompatibility ∧ D.dimensionFinite

theorem differentiable_structure_closed_from_evidence (D : DifferentiableStructurePackage)
    (E : DifferentiableStructureEvidence D) : DifferentiableStructureClosed D := by
  exact And.intro E.smoothCompatibilityAdmissible E.dimensionFiniteAdmissible

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse