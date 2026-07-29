import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure ImplicitFunctionTheoremPackage where
  mapping : Type u
  point : Type v
  derivativeInvertible : Prop
  localSolution : Prop
  uniquenessCondition : Prop
  theoremAdmissible : Prop

structure ImplicitFunctionTheoremEvidence (I : ImplicitFunctionTheoremPackage) where
  derivativeInvertibleAdmissible : I.derivativeInvertible
  localSolutionAdmissible : I.localSolution
  uniquenessConditionAdmissible : I.uniquenessCondition

def ImplicitFunctionTheoremClosed (I : ImplicitFunctionTheoremPackage) : Prop :=
  I.derivativeInvertible ∧ I.localSolution ∧ I.uniquenessCondition

theorem implicit_function_theorem_closed_from_evidence
    (I : ImplicitFunctionTheoremPackage)
    (E : ImplicitFunctionTheoremEvidence I) : ImplicitFunctionTheoremClosed I := by
  exact And.intro E.derivativeInvertibleAdmissible
    (And.intro E.localSolutionAdmissible E.uniquenessConditionAdmissible)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse