
protocol CanFly {
    
    func fly()
}

class Bird {

    var isFemale = true
    
    func layEgg() {
        
        if isFemale {
            print("lay Egg")
        }
    }
    
    init() {}
    
    init(isFemale: Bool) {
        self.isFemale = isFemale
    }
}

class Eagle: Bird, CanFly {
    
    func hunt() {
        print("I killed prey")
    }
    
    func soar() {
        print("KRRRRRrrrrr!!!")
    }
    
    func fly() {
        print("The eagle fly~~!!!")
    }
}

class Penguin: Bird {
    
    func swim() {
        print("I'm swimming!!")
    }
}

struct FlyingMuseum {
    
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    
    func fly() {
        print("Airplane uses Engine for flying")
    }
}

let myEagle = Eagle(isFemale: false)
let myPenguin = Penguin(isFemale: true)
let yourEagle = Eagle()
let museum = FlyingMuseum()

let myPlane = Airplane()

//myEagle.fly()
//myEagle.layEgg()
//myEagle.soar()
//yourEagle.layEgg()

museum.flyingDemo(flyingObject: myEagle)
museum.flyingDemo(flyingObject: myPlane)
