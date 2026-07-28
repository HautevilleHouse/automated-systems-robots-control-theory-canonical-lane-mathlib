import AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.ControlLaw

/-!
# Stability Analysis Package
-/

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure StabilityAnalysisPackage {K : RobotKinematicModelPackage}
    {D : RobotDynamicModelPackage K} (C : ControlLawPackage D) where
  lyapunovFunction : Prop
  derivativeNegativeDefinite : Prop
  asymptoticStability : Prop
  regionOfAttraction : Prop

structure StabilityAnalysisEvidence {K : RobotKinematicModelPackage}
    {D : RobotDynamicModelPackage K} {C : ControlLawPackage D}
    (S : StabilityAnalysisPackage C) where
  lyapunovFunctionClosed : S.lyapunovFunction
  derivativeNegativeDefiniteClosed : S.derivativeNegativeDefinite
  asymptoticStabilityClosed : S.asymptoticStability
  regionOfAttractionClosed : S.regionOfAttraction

def StabilityAnalysisClosed {K : RobotKinematicModelPackage}
    {D : RobotDynamicModelPackage K} {C : ControlLawPackage D}
    (S : StabilityAnalysisPackage C) : Prop :=
  S.lyapunovFunction ∧ S.derivativeNegativeDefinite ∧ S.asymptoticStability ∧ S.regionOfAttraction

theorem stability_analysis_closed_from_evidence
    {K : RobotKinematicModelPackage} {D : RobotDynamicModelPackage K}
    {C : ControlLawPackage D} (S : StabilityAnalysisPackage C)
    (E : StabilityAnalysisEvidence S) : StabilityAnalysisClosed S := by
  exact And.intro E.lyapunovFunctionClosed
    (And.intro E.derivativeNegativeDefiniteClosed
      (And.intro E.asymptoticStabilityClosed E.regionOfAttractionClosed))

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse