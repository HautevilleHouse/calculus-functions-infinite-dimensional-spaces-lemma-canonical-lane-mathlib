import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean

structure BanachSpaceFibersPackage (E F : Type u) [NormedAddCommGroup E] [CompleteSpace E]
    [NormedAddCommGroup F] [CompleteSpace F] where
  baseSpace : E
  fiberSpace : F → Type v
  smoothVectorBundle : Prop
  trivializationSystem : Prop
  fiberwiseNorm : Prop
  smoothVectorBundleClosed : smoothVectorBundle
  trivializationSystemClosed : trivializationSystem
  fiberwiseNormClosed : fiberwiseNorm

structure BanachSpaceFibersEvidence (E F : Type u) [NormedAddCommGroup E] [CompleteSpace E]
    [NormedAddCommGroup F] [CompleteSpace F] (pkg : BanachSpaceFibersPackage E F) where
  smoothVectorBundleClosed : pkg.smoothVectorBundle
  trivializationSystemClosed : pkg.trivializationSystem
  fiberwiseNormClosed : pkg.fiberwiseNorm

def BanachSpaceFibersClosed (E F : Type u) [NormedAddCommGroup E] [CompleteSpace E]
    [NormedAddCommGroup F] [CompleteSpace F] (pkg : BanachSpaceFibersPackage E F) : Prop :=
  pkg.smoothVectorBundle ∧ pkg.trivializationSystem ∧ pkg.fiberwiseNorm

theorem banach_space_fibers_closed_from_evidence (E F : Type u) [NormedAddCommGroup E] [CompleteSpace E]
    [NormedAddCommGroup F] [CompleteSpace F] (pkg : BanachSpaceFibersPackage E F)
    (ev : BanachSpaceFibersEvidence E F pkg) : BanachSpaceFibersClosed E F pkg := by
  exact And.intro ev.smoothVectorBundleClosed
    (And.intro ev.trivializationSystemClosed ev.fiberwiseNormClosed)

end CalculusFunctionsInfiniteDimensionalSpacesLemmaCanonicalLaneLean
end HautevilleHouse