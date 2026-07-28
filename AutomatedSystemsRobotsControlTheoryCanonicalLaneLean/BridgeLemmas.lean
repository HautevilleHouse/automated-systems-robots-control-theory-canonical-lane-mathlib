import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomatedSystemsRobotsControlTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.convergenceProperty

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end AutomatedSystemsRobotsControlTheoryCanonicalLaneLean
end HautevilleHouse