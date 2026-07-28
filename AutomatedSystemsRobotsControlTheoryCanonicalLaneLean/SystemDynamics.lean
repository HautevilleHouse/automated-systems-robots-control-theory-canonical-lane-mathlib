import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure SystemDynamicsPackage where
  stateSpace : Type u
  inputSpace : Type v
  dynamicsFunction : stateSpace → inputSpace → stateSpace
  differentiable : Prop
  lipschitzContinuous : Prop
  initialConditionSpecified : Prop

structure SystemDynamicsEvidence (G : SystemDynamicsPackage) where
  differentiableClosed : G.differentiable
  lipschitzContinuousClosed : G.lipschitzContinuous
  initialConditionSpecifiedClosed : G.initialConditionSpecified

def SystemDynamicsClosed (G : SystemDynamicsPackage) : Prop :=
  G.differentiable ∧ G.lipschitzContinuous ∧ G.initialConditionSpecified

theorem system_dynamics_closed_from_evidence (G : SystemDynamicsPackage)
    (E : SystemDynamicsEvidence G) : SystemDynamicsClosed G := by
  exact And.intro E.differentiableClosed
    (And.intro E.lipschitzContinuousClosed E.initialConditionSpecifiedClosed)

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse