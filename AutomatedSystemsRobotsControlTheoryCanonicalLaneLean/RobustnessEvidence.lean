import AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.ControlSystemModel

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure RobustnessPackage where
  disturbanceBounds : Prop
  stabilityMargin : Prop
  robustClosedLoop : Prop

def RobustnessPackageClosed (R : RobustnessPackage) : Prop :=
  R.disturbanceBounds ∧ R.stabilityMargin ∧ R.robustClosedLoop

structure RobustnessEvidence (R : RobustnessPackage) where
  disturbanceBoundsClosed : R.disturbanceBounds
  stabilityMarginClosed : R.stabilityMargin
  robustClosedLoopClosed : R.robustClosedLoop

theorem robustness_closed_from_evidence (R : RobustnessPackage)
    (E : RobustnessEvidence R) : RobustnessPackageClosed R := by
  exact And.intro E.disturbanceBoundsClosed
    (And.intro E.stabilityMarginClosed E.robustClosedLoopClosed)

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse