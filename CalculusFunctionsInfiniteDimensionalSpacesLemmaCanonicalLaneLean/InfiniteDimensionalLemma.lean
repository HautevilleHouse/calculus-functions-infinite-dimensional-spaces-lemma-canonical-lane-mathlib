import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure InfiniteDimensionalLemmaPackage where
  spacesAdmissible : Prop
  lemmaStatement : Prop
  proofForwardDirection : Prop
  proofReverseDirection : Prop
  lemmaClosed : Prop

structure InfiniteDimensionalLemmaEvidence (L : InfiniteDimensionalLemmaPackage) where
  lemmaStatementAdmissible : L.lemmaStatement
  proofForwardDirectionAdmissible : L.proofForwardDirection
  proofReverseDirectionAdmissible : L.proofReverseDirection

def InfiniteDimensionalLemmaClosed (L : InfiniteDimensionalLemmaPackage) : Prop :=
  L.lemmaStatement ∧ L.proofForwardDirection ∧ L.proofReverseDirection

theorem infinite_dimensional_lemma_closed_from_evidence (L : InfiniteDimensionalLemmaPackage)
    (E : InfiniteDimensionalLemmaEvidence L) : InfiniteDimensionalLemmaClosed L := by
  exact And.intro E.lemmaStatementAdmissible
    (And.intro E.proofForwardDirectionAdmissible E.proofReverseDirectionAdmissible)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse