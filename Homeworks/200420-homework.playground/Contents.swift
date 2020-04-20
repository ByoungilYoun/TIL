import UIKit

//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//   구현 내용은 자유롭게
//
// ** 강아지 (Dog)
// - 속성: 이름, 나이, 몸무게, 견종
// - 행위: 짖기, 먹기

class Dog {
    var name : String
    var age : Int
    var weight : Double
    var species : String
    
    init(name : String, age : Int, weight : Double, species : String){
        self.name = name
        self.age = age
        self.weight = weight
        self.species = species
    }
    
    func bark (name : String) {
        print("\(name)가 짖습니다.")
    }
    
    func eat (name : String) {
        print("\(name)가 밥을 먹습니다.")
    }
}

var mydog = Dog(name: "뽀삐", age: 4, weight: 15.9, species: "허스키")
mydog.bark(name: "뽀삐")
mydog.eat(name: "뽀삐")
//
// ** 학생 (Student)
// - 속성: 이름, 나이, 학교명, 학년
// - 행위: 공부하기, 먹기, 잠자기

class Student {
    var name : String
    var age : Int
    var schoolName : String
    var grade : Int
    
    init(name : String, age : Int, grade : Int) {
        self.name = name
        self.age = age
        schoolName = "정광고등학교"
        self.grade = grade
    }
    
    func study() {
        print("공부합니다.")
    }
    
    func eat(){
        print("밥을 먹습니다.")
    }
    
    func sleep(name:String){
        print("\(name)이 자고있습니다.")
    }
}

let person1 : Student = Student(name: "윤병일", age: 26, grade: 4)
person1.age
person1.eat()
person1.schoolName
person1.sleep(name: "윤병일")

// ** 아이폰(IPhone)
// - 속성: 기기명, 가격, faceID 기능 여부(Bool)
// - 행위: 전화 걸기, 문자 전송

class iPhone {
    var phoneSpecies : String
    var price : Int
    var faceID : Bool
    
    init(phoneSpecies : String, price : Int, faceID : Bool) {
        self.phoneSpecies = phoneSpecies
        self.price = price
        self.faceID = faceID
    }
    
    func hangOn () {
        print("전화를 걸고있습니다.")
    }
    
    func sendMessage(){
        print("문자를 보냅니다.")
    }
    
}

let myPhone = iPhone(phoneSpecies: "아이폰8", price: 990000, faceID: false)
myPhone.phoneSpecies
myPhone.faceID


// ** 커피(Coffee)
// - 속성: 이름, 가격, 원두 원산지

class Coffee {
    var name : String
    var price : Int
    var from : String
    
    init(name : String, price : Int) {
        self.name = name
        self.price = price
        from = "에티오피아"
    }
    
}

let myCoffee : Coffee = Coffee(name: "에스프레소", price: 2000)
myCoffee.from
myCoffee.name
myCoffee.price


//
//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//
// ** 계산기 (Calculator)
// - 속성: 현재 값
// - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//
// ex)
// let calculator = Calculator() // 객체생성
//
// calculator.value  // 0
//
// calculator.add(10)    // 10
// calculator.add(5)     // 15
//
// calculator.subtract(9)  // 6
// calculator.subtract(10) // -4
//
// calculator.multiply(4)   // -16
// calculator.multiply(-10) // 160
//
// calculator.divide(10)   // 16
// calculator.reset()      // 0

class Calculator {
    var value : Int
    
    init(value : Int) {
        self.value = value
    }
    
    func add (_ num :Int ) -> Int {
        value += num
        return value
    }
    func subtract (_ num : Int) -> Int {
        value -= num
        return value
    }
    func multiply (_ num : Int) -> Int {
        value *= num
        return value
    }
    func devide (_ num : Int) -> Int {
        value /= num
        return value
    }
    func reset() -> Int{
        return 0
    }
}

let myCalculator = Calculator(value: 0)
myCalculator.add(10)
myCalculator.add(5)
myCalculator.subtract(9)
myCalculator.subtract(10)
myCalculator.multiply(4)
myCalculator.multiply(-10)
myCalculator.devide(10)
myCalculator.reset()

