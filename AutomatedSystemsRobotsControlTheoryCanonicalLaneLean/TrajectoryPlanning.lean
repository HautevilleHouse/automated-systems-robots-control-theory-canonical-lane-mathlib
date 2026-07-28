import AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.StabilityAnalysis

/-!
# Trajectory Planning Package
-/

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure TrajectoryPlanningPackage {K : RobotKinematicModelPackage}
    {D : RobotDynamicModelPackage K} {C : ControlLawPackage D}
    (S : StabilityAnalysisPackage C) where
  pathFeasibility : Prop
  collisionAvoidance : Prop
  timeOptimality : Prop
  smoothnessConstraint : Prop

structure TrajectoryPlanningEvidence {K : RobotKinematicModelPackage}
    {D : RobotDynamicModelPackage K} {C : ControlLawPackage D}
    {S : StabilityAnalysisPackage C} (T : TrajectoryPlanningPackage S) where
  pathFeasibilityClosed : T.pathFeasibility
  collisionAvoidanceClosed : T.collisionAvoidance
  timeOptimalityClosed : T.timeOptimality
  smoothnessConstraintClosed : T.smoothnessConstraint

def TrajectoryPlanningClosed {K : RobotKinematicModelPackage}
    {D : RobotDynamicModelPackage K} {C : ControlLawPackage D}
    {S : StabilityAnalysisPackage C} (T : TrajectoryPlanningPackage S) : Prop :=
  T.pathFeasibility ∧ T.collisionAvoidance ∧ T.timeOptimality ∧ T.smoothnessConstraint

theorem trajectory_planning_closed_from_evidence
    {K : RobotKinematicModelPackage} {D : RobotDynamicModelPackage K}
    {C : ControlLawPackage D} {S : StabilityAnalysisPackage C}
    (T : TrajectoryPlanningPackage S) (E : TrajectoryPlanningEvidence T) :
    TrajectoryPlanningClosed T := by
  exact And.intro E.pathFeasibilityClosed
    (And.intro E.collisionAvoidanceClosed
      (And.intro E.timeOptimalityClosed E.smoothnessConstraintClosed))

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse