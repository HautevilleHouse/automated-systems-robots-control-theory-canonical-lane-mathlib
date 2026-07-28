import AutomatedSystemsRobotsControlTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure StateSpaceModel where
  stateVector : Type
  inputVector : Type
  outputVector : Type
  dynamics : stateVector → inputVector → stateVector
  outputMap : stateVector → outputVector
  smoothness : Prop
  controllability : Prop
  observability : Prop

structure LyapunovStability where
  stateSpaceModel : StateSpaceModel
  lyapunovFunction : stateSpaceModel.stateVector → ℝ
  positiveDefinite : Prop
  derivativeNegative : Prop
  asymptoticStability : Prop

structure ControllerSynthesis where
  lyapunovStability : LyapunovStability
  controlLaw : lyapunovStability.stateSpaceModel.stateVector → lyapunovStability.stateSpaceModel.inputVector
  stabilizability : Prop
  performanceGuarantee : Prop

def ControlSystemPackageClosed (S : StateSpaceModel) (L : LyapunovStability) (C : ControllerSynthesis) : Prop :=
  S.smoothness ∧ S.controllability ∧ S.observability ∧
  L.positiveDefinite ∧ L.derivativeNegative ∧ L.asymptoticStability ∧
  C.stabilizability ∧ C.performanceGuarantee

theorem control_system_package_closed_from_evidence (S : StateSpaceModel) (L : LyapunovStability) (C : ControllerSynthesis) (hS : S.smoothness ∧ S.controllability ∧ S.observability) (hL : L.positiveDefinite ∧ L.derivativeNegative ∧ L.asymptoticStability) (hC : C.stabilizability ∧ C.performanceGuarantee) : ControlSystemPackageClosed S L C := by
  exact And.intro hS.1 (And.intro hS.2.1 (And.intro hS.2.2 (And.intro hL.1 (And.intro hL.2.1 (And.intro hL.2.2 (And.intro hC.1 hC.2)))))))

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse