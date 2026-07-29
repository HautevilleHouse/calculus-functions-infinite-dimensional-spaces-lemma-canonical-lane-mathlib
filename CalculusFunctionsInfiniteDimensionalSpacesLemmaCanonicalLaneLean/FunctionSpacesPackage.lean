import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure FunctionSpacesPackage where
  banachSpace : Type u
  norm : banachSpace → ℝ
  completeness : Prop
  linearStructure : Prop
  spaceAdmissible : Prop

structure FunctionSpacesEvidence (F : FunctionSpacesPackage) where
  normAdmissible : F.norm > 0
  completenessAdmissible : F.completeness
  linearStructureAdmissible : F.linearStructure

def FunctionSpacesClosed (F : FunctionSpacesPackage) : Prop :=
  F.norm > 0 ∧ F.completeness ∧ F.linearStructure

theorem function_spaces_closed_from_evidence (F : FunctionSpacesPackage)
    (E : FunctionSpacesEvidence F) : FunctionSpacesClosed F := by
  exact And.intro E.normAdmissible
    (And.intro E.completenessAdmissible E.linearStructureAdmissible)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse