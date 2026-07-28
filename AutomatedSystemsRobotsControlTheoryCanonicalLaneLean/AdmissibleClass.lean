import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

structure RobotSystem where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace × controlSpace → stateSpace
  goalSet : stateSpace → Prop
  admissibleControls : stateSpace → controlSpace → Prop
  stabilityProperty : Prop

structure RobotAdmittedObject where
  system : RobotSystem
  initialCondition : system.stateSpace
  controlPolicy : system.stateSpace → system.controlSpace
  policyAdmissible : ∀ x, system.admissibleControls x (controlPolicy x)
  convergenceProperty : Prop
  conclusion : convergenceProperty

structure AdmissibleClass where
  object : RobotAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.convergenceProperty) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse