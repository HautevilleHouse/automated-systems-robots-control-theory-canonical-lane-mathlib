import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

def ConstrainedRobotControlClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_robot_control_endgame (A : AdmissibleClass) : ConstrainedRobotControlClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse