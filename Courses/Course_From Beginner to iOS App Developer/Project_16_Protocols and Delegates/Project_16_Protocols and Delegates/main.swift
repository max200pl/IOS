protocol AdvancedLifeSupport {
    func provideCPR()
}

class EmergancyCallHanlder {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Assessing situation...")
        
    }
    
    func medicalEmergency() {
        delegate?.provideCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
        
    init(handler: EmergancyCallHanlder){
        handler.delegate = self
    }
    
    func provideCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergancyCallHanlder){
        handler.delegate = self
    }
    
    func provideCPR() {
        print("The doctor does chest compressions, 30 pre second.")
    }
    
    func useStethescope() {
        print("Listeing for heart sounds")
    }
}

class Surgeon: Doctor {
    override func provideCPR() {
        super.provideCPR()
        print("Sings staing alive be the BeeGess")
    }
    
    func useElectricDrill(){
        print("Whirr...")
    }
}

let emilio = EmergancyCallHanlder()
//let pete = Paramedic(handler: emilio)
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
