import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.NormedSpace.Banach

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure BanachSpacePackage where
  space : Type u
  norm : space → ℝ
  normedAddCommGroup : NormedAddCommGroup space
  normedSpace : NormedSpace ℝ space
  complete : CompleteSpace space
  separable : Prop
  dualSpace : Type v
  dualNormedSpace : NormedSpace ℝ dualSpace
  reflexive : Prop

structure BanachSpaceEvidence (B : BanachSpacePackage) where
  normedAddCommGroupClosed : B.normedAddCommGroup
  normedSpaceClosed : B.normedSpace
  completeClosed : B.complete
  separableClosed : B.separable
  dualNormedSpaceClosed : B.dualNormedSpace
  reflexiveClosed : B.reflexive

def BanachSpaceClosed (B : BanachSpacePackage) : Prop :=
  B.normedAddCommGroup ∧ B.normedSpace ∧ B.complete ∧ B.separable ∧ B.dualNormedSpace ∧ B.reflexive

theorem banach_space_closed_from_evidence (B : BanachSpacePackage) (E : BanachSpaceEvidence B) :
    BanachSpaceClosed B := by
  exact And.intro E.normedAddCommGroupClosed
    (And.intro E.normedSpaceClosed
      (And.intro E.completeClosed
        (And.intro E.separableClosed
          (And.intro E.dualNormedSpaceClosed E.reflexiveClosed))))

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse