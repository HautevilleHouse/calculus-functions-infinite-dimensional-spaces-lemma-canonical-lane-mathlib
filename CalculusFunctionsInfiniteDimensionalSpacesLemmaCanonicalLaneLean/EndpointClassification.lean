import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Calculus.ContDiff

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure EndpointClassificationPackage {B : BanachSpacePackage}
    {D : DifferentialCalculusPackage B}
    {I : InverseFunctionTheoremPackage B D} where
  targetSpace : Type u
  targetTopology : TopologicalSpace targetSpace
  diffClass : C^∞ (I.mapping) targetSpace
  endpointStatement : Prop
  differentiableStructurePreserved : Prop
  endpointMatchesCalculusLemma : Prop

structure EndpointClassificationEvidence {B : BanachSpacePackage}
    {D : DifferentialCalculusPackage B}
    {I : InverseFunctionTheoremPackage B D}
    (E : EndpointClassificationPackage B D I) where
  differentiableStructurePreservedClosed : E.differentiableStructurePreserved
  endpointMatchesCalculusLemmaClosed : E.endpointMatchesCalculusLemma

def EndpointClassificationClosed {B : BanachSpacePackage}
    {D : DifferentialCalculusPackage B}
    {I : InverseFunctionTheoremPackage B D}
    (E : EndpointClassificationPackage B D I) : Prop :=
  E.differentiableStructurePreserved ∧ E.endpointMatchesCalculusLemma

theorem endpoint_classification_closed_from_evidence
    {B : BanachSpacePackage} {D : DifferentialCalculusPackage B}
    {I : InverseFunctionTheoremPackage B D}
    (E : EndpointClassificationPackage B D I)
    (Ev : EndpointClassificationEvidence E) : EndpointClassificationClosed E := by
  exact And.intro Ev.differentiableStructurePreservedClosed Ev.endpointMatchesCalculusLemmaClosed

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse