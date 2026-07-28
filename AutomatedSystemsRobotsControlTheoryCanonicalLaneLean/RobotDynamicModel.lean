import AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.RobotKinematicModel

/-!
# Robot Dynamic Model Package
-/

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure RobotDynamicModelPackage (K : RobotKinematicModelPackage) where
  massMatrix : Prop
  coriolisMatrix : Prop
  gravityTorque : Prop
  frictionModel : Prop
  equationOfMotion : Prop

structure RobotDynamicModelEvidence {K : RobotKinematicModelPackage}
    (D : RobotDynamicModelPackage K) where
  massMatrixClosed : D.massMatrix
  coriolisMatrixClosed : D.coriolisMatrix
  gravityTorqueClosed : D.gravityTorque
  frictionModelClosed : D.frictionModel
  equationOfMotionClosed : D.equationOfMotion

def RobotDynamicModelClosed {K : RobotKinematicModelPackage}
    (D : RobotDynamicModelPackage K) : Prop :=
  D.massMatrix ∧ D.coriolisMatrix ∧ D.gravityTorque ∧ D.frictionModel ∧ D.equationOfMotion

theorem robot_dynamic_model_closed_from_evidence
    {K : RobotKinematicModelPackage} (D : RobotDynamicModelPackage K)
    (E : RobotDynamicModelEvidence D) : RobotDynamicModelClosed D := by
  exact And.intro E.massMatrixClosed
    (And.intro E.coriolisMatrixClosed
      (And.intro E.gravityTorqueClosed
        (And.intro E.frictionModelClosed E.equationOfMotionClosed)))

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse