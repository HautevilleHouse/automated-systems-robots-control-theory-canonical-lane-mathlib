import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse