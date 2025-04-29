class Enemy {
    var health: Int
    var attackStrenght: Int
    
    init(health: Int, attackStrenght: Int) {
        self.health = health
        self.attackStrenght = attackStrenght
    }
    
    func takeDamage(_ amount: Int) {
        health -= amount
    }
    
    func move () {
        print( "Enemy is muving")
    }
    
    func attack() {
        print( "Enemy is attacking \(attackStrenght)")
    }
}
