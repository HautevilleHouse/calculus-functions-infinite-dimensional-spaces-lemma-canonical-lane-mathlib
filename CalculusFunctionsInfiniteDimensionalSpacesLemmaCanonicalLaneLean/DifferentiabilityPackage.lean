import canonicalLaneMathlib.AdmissibleClass
import CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean.BanachSpaceFibersPackage

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure DifferentiabilityPackage {E F : Type u} [NormedAddCommGroup E] [CompleteSpace E]
    [NormedAddCommGroup F] [CompleteSpace F] (bundle : BanachSpaceFibersPackage E F) where
  gateauxDerivative : Prop
  frechetDerivative : Prop
  chainRule : Prop
  meanValueTheorem : Prop
  gateauxDerivativeClosed : gateauxDerivative
  frechetDerivativeClosed : frechetDerivative
  chainRuleClosed : chainRule
  meanValueTheoremClosed : meanValueTheorem

structure DifferentiabilityEvidence {E F : Type u} [NormedAddCommGroup E] [CompleteSpace E]
    [NormedAddCommGroup F] [CompleteSpace F] {bundle : BanachSpaceFibersPackage E F}
    (pkg : DifferentiabilityPackage bundle) where
  gateauxDerivativeClosed : pkg.gateauxDerivative
  frechetDerivativeClosed : pkg.frechetDerivative
  chainRuleClosed : pkg.chainRule
  meanValueTheoremClosed : pkg.meanValueTheorem

def DifferentiabilityClosed {E F : Type u} [NormedAddCommGroup E] [CompleteSpace E]
    [NormedAddCommGroup F] [CompleteSpace F] {bundle : BanachSpaceFibersPackage E F}
    (pkg : DifferentiabilityPackage bundle) : Prop :=
  pkg.gateauxDerivative ∧ pkg.frechetDerivative ∧ pkg.chainRule ∧ pkg.meanValueTheorem

theorem differentiability_closed_from_evidence {E F : Type u} [NormedAddCommGroup E] [CompleteSpace E]
    [NormedAddCommGroup F] [CompleteSpace F] {bundle : BanachSpaceFibersPackage E F}
    (pkg : DifferentiabilityPackage bundle) (ev : DifferentiabilityEvidence pkg) :
    DifferentiabilityClosed pkg := by
  exact And.intro ev.gateauxDerivativeClosed
    (And.intro ev.frechetDerivativeClosed
      (And.intro ev.chainRuleClosed ev.meanValueTheoremClosed))

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse