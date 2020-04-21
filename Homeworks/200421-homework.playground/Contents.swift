import UIKit

// 과제 : 상속 적용해보기
//       이미지처럼 Animal, Human , Pet, Dog, Cat 클래스 정의
// 상속을 적용해 필요한 속성을 모두 가지면서도 각각 다른 속성과 값을 지닐 수 있도록 구현

class Animal {
    var brain : Bool
    var legs : Int
        
    init(brain : Bool, legs : Int) {
        self.brain = brain
        self.legs = legs
    }
}

class Human : Animal {
    var lang : String
    
    init(brain : Bool, legs : Int , lang : String) {
        self.lang = lang
        super.init(brain: brain, legs: legs)
    }
}

class Pet : Animal {
    var fleas : Int
    
    init(brain : Bool, legs : Int, fleas : Int) {
        self.fleas = fleas
        super.init(brain: brain, legs: legs)
    }
}

class Dog : Pet {
    
}

class Cat : Pet {
    
}

var object1 = Animal(brain: true, legs: 0)
object1.brain
object1.legs

var object2 = Human(brain: true, legs: 2, lang: "Korean")
object2.brain
object2.legs
object2.lang

var object3 = Pet(brain: true, legs: 4, fleas: 0)
object3.fleas
object3.brain
object3.legs

var object4 = Dog(brain: true, legs: 4, fleas: 8)
object4.fleas

var object5 = Cat(brain: true, legs: 4, fleas: 4)
object5.fleas





//class Animal {
//    var brain: Bool
//    var legs: Int
//
//    init(brain: Bool = true, legs: Int = 0) {
//        self.brain = brain
//        self.legs = legs
//    }
//}
//
//class Human: Animal {
//    var lang : String
//
//    override var legs: Int {
//        get {
//            return super.legs
//        }
//        set {
//            super.legs = newValue
//        }
//    }
//
//    init(legs: Int = 2, lang: String = "korean") {
//        self.lang = lang
//        super.init(legs: legs)
//    }
//}
//
//
//class Pet: Animal {
//    var fleas: Int
//
//    init(fleas: Int = 0, legs: Int = 4) {
//        self.fleas = fleas
//        super.init(legs: legs)
//    }
//}
//
//
//
//class Dog: Pet {
//    init(fleas: Int = 8) {
//        super.init(fleas: fleas)
//    }
//}
//
//class Cat: Pet {
//    init(fleas: Int = 4) {
//        super.init(fleas: fleas)
//    }
//}
//
//
////var animal = Animal(brain: false, legs: 6)
//var animal = Animal()
//animal.brain
//animal.brain = true
//animal.brain
//animal.legs
//
//
//var human = Human()
//human.legs
//human.legs = 4
//human.legs
//
//
//var pet = Pet()
//pet.brain
//pet.fleas
//pet.legs
//
//
//var dog = Dog()
//dog.brain
//dog.fleas
//dog.legs
//
//
//var cat = Cat()
//cat.brain
//cat.fleas
//cat.legs
