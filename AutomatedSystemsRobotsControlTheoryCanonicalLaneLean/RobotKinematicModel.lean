import AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.AdmissibleClass

/-!
# Robot Kinematic Model Package
-/

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure RobotKinematicModelPackage where
  joints : Nat
  links : Nat
  forwardKinematics : Prop
  inverseKinematics : Prop
  jacobianMatrix : Prop
  workspaceBound : Prop

structure RobotKinematicModelEvidence (K : RobotKinematicModelPackage) where
  forwardKinematicsClosed : K.forwardKinematics
  inverseKinematicsClosed : K.inverseKinematics
  jacobianMatrixClosed : K.jacobianMatrix
  workspaceBoundClosed : K.workspaceBound

def RobotKinematicModelClosed (K : RobotKinematicModelPackage) : Prop :=
  K.forwardKinematics ∧ K.inverseKinematics ∧ K.jacobianMatrix ∧ K.workspaceBound

theorem robot_kinematic_model_closed_from_evidence (K : RobotKinematicModelPackage)
    (E : RobotKinematicModelEvidence K) : RobotKinematicModelClosed K := by
  exact And.intro E.forwardKinematicsClosed
    (And.intro E.inverseKinematicsClosed
      (And.intro E.jacobianMatrixClosed E.workspaceBoundClosed))

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse