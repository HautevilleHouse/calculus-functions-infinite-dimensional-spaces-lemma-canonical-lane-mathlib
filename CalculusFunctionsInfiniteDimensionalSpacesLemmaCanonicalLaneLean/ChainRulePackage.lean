import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure ChainRulePackage where
  functionOne : Type u
  functionTwo : Type v
  composition : Type w
  derivativeFormula : Prop
  boundedLinearCondition : Prop
  chainRuleAdmissible : Prop

structure ChainRuleEvidence (C : ChainRulePackage) where
  derivativeFormulaAdmissible : C.derivativeFormula
  boundedLinearConditionAdmissible : C.boundedLinearCondition

def ChainRuleClosed (C : ChainRulePackage) : Prop :=
  C.derivativeFormula ∧ C.boundedLinearCondition

theorem chain_rule_closed_from_evidence (C : ChainRulePackage)
    (E : ChainRuleEvidence C) : ChainRuleClosed C := by
  exact And.intro E.derivativeFormulaAdmissible E.boundedLinearConditionAdmissible

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse