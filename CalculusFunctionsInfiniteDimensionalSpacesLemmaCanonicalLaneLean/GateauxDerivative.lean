import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure GateauxDerivativePackage (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  function : X → Y
  direction : X
  derivativeExists : Prop
  linearInDirection : Prop
  boundedLinearCandidate : Prop
  relationToFrechet : Prop

structure GateauxDerivativeEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (G : GateauxDerivativePackage X Y) where
  derivativeExistsClosed : G.derivativeExists
  linearInDirectionClosed : G.linearInDirection
  boundedLinearCandidateClosed : G.boundedLinearCandidate
  relationToFrechetClosed : G.relationToFrechet

def GateauxDerivativeClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (G : GateauxDerivativePackage X Y) : Prop :=
  G.derivativeExists ∧ G.linearInDirection ∧ G.boundedLinearCandidate ∧ G.relationToFrechet

theorem gateaux_derivative_closed_from_evidence
  {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (G : GateauxDerivativePackage X Y) (E : GateauxDerivativeEvidence G) :
  GateauxDerivativeClosed G := by
  exact And.intro E.derivativeExistsClosed (And.intro E.linearInDirectionClosed (And.intro E.boundedLinearCandidateClosed E.relationToFrechetClosed))

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse