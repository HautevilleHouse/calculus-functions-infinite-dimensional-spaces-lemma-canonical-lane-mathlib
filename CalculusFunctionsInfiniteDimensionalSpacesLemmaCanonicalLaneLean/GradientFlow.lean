import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure GradientFlowPackage (X : Type) [NormedAddCommGroup X] [InnerProductSpace ℝ X] [CompleteSpace X] where
  energyFunctional : X → ℝ
  initialCondition : X
  flowEquation : Prop
  existenceInterval : ℝ
  uniqueness : Prop
  monotonicity : Prop
  convergence : Prop

structure GradientFlowEvidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] [CompleteSpace X]
  (G : GradientFlowPackage X) where
  flowEquationClosed : G.flowEquation
  existenceIntervalClosed : G.existenceInterval = G.existenceInterval
  uniquenessClosed : G.uniqueness
  monotonicityClosed : G.monotonicity
  convergenceClosed : G.convergence

def GradientFlowClosed {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] [CompleteSpace X]
  (G : GradientFlowPackage X) : Prop :=
  G.flowEquation ∧ G.uniqueness ∧ G.monotonicity ∧ G.convergence

theorem gradient_flow_closed_from_evidence
  {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] [CompleteSpace X]
  (G : GradientFlowPackage X) (E : GradientFlowEvidence G) :
  GradientFlowClosed G := by
  exact And.intro E.flowEquationClosed (And.intro E.uniquenessClosed (And.intro E.monotonicityClosed E.convergenceClosed))

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse