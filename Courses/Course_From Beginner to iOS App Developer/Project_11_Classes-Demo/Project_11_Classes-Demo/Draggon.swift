class Draggon: Enemy {
    var wingSpan = 2
    
    func talk(speech: String){
        print("Say: \(speech)")
    }
    
    override func move() {
        print("Draggon is moving")
    }
    
    override func attack() {
        super.attack()
        print("Draggon is attacking")
    }
}
