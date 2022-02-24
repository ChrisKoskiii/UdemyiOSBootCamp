protocol AdvancedLifeSupport {
  func performCPR()
}

class EmergencyCallHandler{
  var delegate: AdvancedLifeSupport?
  
  func assessSituation() {
    print("Can you tell me what happened")
  }
  
  func medicalEmergency() {
    delegate?.performCPR()
  }
}

struct Paramedic: AdvancedLifeSupport {
  
  init(handler: EmergencyCallHandler) {
    handler.delegate = self
  }
  
  func performCPR() {
    print("The paramedic does chest compressions")
  }
}

class Doctor: AdvancedLifeSupport {
  
  init(handler: EmergencyCallHandler) {
    handler.delegate = self
  }
  
  func performCPR() {
    print("The doctor does chest compressions")
  }
  func useStethoscope() {
    print("Listening for heart sounds")
  }
}

class Surgeon: Doctor {
  override func performCPR() {
    super.performCPR()
    print("Sings staying alive bt the BeeGees")
  }
  
  func useElectricDrill() {
    print("Makes loud sounds")
  }
}

let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
