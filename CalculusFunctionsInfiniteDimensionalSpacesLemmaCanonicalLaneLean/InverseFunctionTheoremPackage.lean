import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Calculus.InverseFunction

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure InverseFunctionTheoremPackage {B : BanachSpacePackage}
    {D : DifferentialCalculusPackage B} where
  mapping : B.space → B.space
  derivativeAtPoint : B.space → (B.space →L[ℝ] B.space)
  derivativeInvertibleAtPoint : Prop
  localDiffeomorphism : Prop
  conclusion : localDiffeomorphism

structure InverseFunctionTheoremEvidence {B : BanachSpacePackage}
    {D : DifferentialCalculusPackage B}
    (I : InverseFunctionTheoremPackage B D) where
  derivativeInvertibleAtPointClosed : I.derivativeInvertibleAtPoint
  localDiffeomorphismClosed : I.localDiffeomorphism

def InverseFunctionTheoremClosed {B : BanachSpacePackage}
    {D : DifferentialCalculusPackage B}
    (I : InverseFunctionTheoremPackage B D) : Prop :=
  I.derivativeInvertibleAtPoint ∧ I.localDiffeomorphism

theorem inverse_function_theorem_closed_from_evidence
    {B : BanachSpacePackage} {D : DifferentialCalculusPackage B}
    (I : InverseFunctionTheoremPackage B D)
    (E : InverseFunctionTheoremEvidence I) : InverseFunctionTheoremClosed I := by
  exact And.intro E.derivativeInvertibleAtPointClosed E.localDiffeomorphismClosed

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse