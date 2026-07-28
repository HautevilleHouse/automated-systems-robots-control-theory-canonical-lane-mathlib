import AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.RobotDynamicModel

/-!
# Control Law Package
-/

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure ControlLawPackage {K : RobotKinematicModelPackage}
    (D : RobotDynamicModelPackage K) where
  controlType : String
  feedbackGain : Prop
  stabilityGuarantee : Prop
  robustnessMargin : Prop
  disturbanceRejection : Prop

structure ControlLawEvidence {K : RobotKinematicModelPackage}
    {D : RobotDynamicModelPackage K} (C : ControlLawPackage D) where
  feedbackGainClosed : C.feedbackGain
  stabilityGuaranteeClosed : C.stabilityGuarantee
  robustnessMarginClosed : C.robustnessMargin
  disturbanceRejectionClosed : C.disturbanceRejection

def ControlLawClosed {K : RobotKinematicModelPackage}
    {D : RobotDynamicModelPackage K} (C : ControlLawPackage D) : Prop :=
  C.feedbackGain ∧ C.stabilityGuarantee ∧ C.robustnessMargin ∧ C.disturbanceRejection

theorem control_law_closed_from_evidence
    {K : RobotKinematicModelPackage} {D : RobotDynamicModelPackage K}
    (C : ControlLawPackage D) (E : ControlLawEvidence C) : ControlLawClosed C := by
  exact And.intro E.feedbackGainClosed
    (And.intro E.stabilityGuaranteeClosed
      (And.intro E.robustnessMarginClosed E.disturbanceRejectionClosed))

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse