import HautevilleHouse.AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.ControlLaw

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure StateEstimationPackage {D : SystemDynamicsPackage} (C : ControlLawPackage D) where
  observerDynamics : D.stateSpace → D.inputSpace → D.stateSpace
  convergenceRate : Prop
  noiseAttenuation : Prop

structure StateEstimationEvidence {D : SystemDynamicsPackage} {C : ControlLawPackage D}
    (S : StateEstimationPackage C) where
  convergenceRateClosed : S.convergenceRate
  noiseAttenuationClosed : S.noiseAttenuation

def StateEstimationClosed {D : SystemDynamicsPackage} {C : ControlLawPackage D}
    (S : StateEstimationPackage C) : Prop :=
  S.convergenceRate ∧ S.noiseAttenuation

theorem state_estimation_closed_from_evidence {D : SystemDynamicsPackage}
    {C : ControlLawPackage D} (S : StateEstimationPackage C)
    (E : StateEstimationEvidence S) : StateEstimationClosed S := by
  exact And.intro E.convergenceRateClosed E.noiseAttenuationClosed

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse