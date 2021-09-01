protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Parmamedic: AdvancedLifeSupport {
    
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compression, 30 per second.")
    }
    
    func useStatescope() {
        
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor {
    
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr...")
    }
}



let emilio = EmergencyCallHandler()
let pete = Parmamedic(handler: emilio)
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
