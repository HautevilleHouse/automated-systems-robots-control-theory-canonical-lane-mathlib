import HautevilleHouse.AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.StateEstimation

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure StabilityCertificatePackage {D : SystemDynamicsPackage} {C : ControlLawPackage D}
    (S : StateEstimationPackage C) where
  lyapunovFunction : D.stateSpace → ℝ
  lyapunovDecrease : Prop
  invariantSet : Prop

structure StabilityCertificateEvidence {D : SystemDynamicsPackage} {C : ControlLawPackage D}
    {S : StateEstimationPackage C} (T : StabilityCertificatePackage S) where
  lyapunovDecreaseClosed : T.lyapunovDecrease
  invariantSetClosed : T.invariantSet

def StabilityCertificateClosed {D : SystemDynamicsPackage} {C : ControlLawPackage D}
    {S : StateEstimationPackage C} (T : StabilityCertificatePackage S) : Prop :=
  T.lyapunovDecrease ∧ T.invariantSet

theorem stability_certificate_closed_from_evidence {D : SystemDynamicsPackage}
    {C : ControlLawPackage D} {S : StateEstimationPackage C}
    (T : StabilityCertificatePackage S) (E : StabilityCertificateEvidence T) :
    StabilityCertificateClosed T := by
  exact And.intro E.lyapunovDecreaseClosed E.invariantSetClosed

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse