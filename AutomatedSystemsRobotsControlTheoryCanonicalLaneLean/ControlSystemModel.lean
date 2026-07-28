import AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure ControlSystemPackage where
  stateSpace : Type u
  dynamics : Type v
  controlLaw : Type w
  stabilityProperty : Prop
  reachabilityProperty : Prop

def ControlSystemPackageClosed (C : ControlSystemPackage) : Prop :=
  C.stabilityProperty ∧ C.reachabilityProperty

structure ControlSystemEvidence (C : ControlSystemPackage) where
  stabilityPropertyClosed : C.stabilityProperty
  reachabilityPropertyClosed : C.reachabilityProperty

theorem control_system_closed_from_evidence (C : ControlSystemPackage)
    (E : ControlSystemEvidence C) : ControlSystemPackageClosed C := by
  exact And.intro E.stabilityPropertyClosed E.reachabilityPropertyClosed

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse