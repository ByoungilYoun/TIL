# OOP : Object-Oriented Programming

---

## Contents 

	- Class 
	- Initialize
	- Property
	- Equatable, Identical 

---



1. **Class**

   ```swift
   //형식
   /*
    class ClassName: SuperClassName, ProtocolName... {
      PropertyList
      MethodList
    }
    
    let objectName = ClassName()
    objectName.propertyName
    objectName.functionName()
    */
   
   class Dog {
     var color = "White"
     var eyeColor = "Black"
     var height = 30.0
     var weight = 6.0
     
     func sit() {
       print("sit")
     }
     func layDown() {
       print("layDown")
     }
     func shake() {
       print("shake")
     }
   }
   
   
   let bobby: Dog = Dog()
   bobby.color
   bobby.color = "Gray"
   bobby.color
   bobby.sit()
   
   let tory = Dog()
   tory.color = "Brown"
   tory.layDown()
   
   ```

   ---

2. **Class Initialize** 

    Class 의 초기화 메서드 

   - 초기화(init)가 불필요한 경우 : 모든 저장 프로퍼티에 초기값이 설정되어 있음

   	-  초기화(init)가 필요한 경우 : 저장 프로퍼티 중 하나 이상이 초기값 미설정됨

   ```swift
   /*
    모든 저장 프로퍼티 (Stored Properties)에 초기값이 설정된 경우 Init 메서드 작성 불필요
    객체 생성시 단순히 ClassName() 만으로 생성 가능
    */
   
   class Dog1 {
     let name = "Tory"
     let color = "Brown"
     
     func bowwow() {
       print("Dog1 Bowwow!")
     }
   }
   
   let tory = Dog1()
   // let tory = Dog1.init() 이렇게 생략되있다. 
   tory.bowwow()
   
   
   /*
    초기화 메서드가 필요한 경우 - 저장 프로퍼티 중 하나 이상이 초기값 미설정
    ==> init 메서드를 통해 설정
    */
   
   // 파라미터 없는 경우
   
   class Dog2 {
     let name: String
     let color: String
     
     init() {
       name = "Tory"
       color = "Brown"
     }
     
     func bowwow() {
       print("Dog2 Bowwow!")
     }
   }
   
   let tory2 = Dog2()
   tory2.bowwow()
   
   
   // 파라미터를 통해 설정하는 경우
   
   class Dog3 {
     let name: String
     let color: String
   
     init(name: String) {
       self.name = name
       color = "Brown"
     }
     init(name: String, color: String) {
       self.name = name
       self.color = color
     }
     
     func bowwow() {
       print("Dog3 Bowwow!")
     }
   }
   
   var tory3 = Dog3(name: "Tory")
   var tory4 = Dog3(name: "Tory", color: "White")
   
   tory3.name
   tory3.color
   
   tory4.name
   tory4.color
   ```

   ---

3. **Property**

   - Stored Property (저장 속성)

   ``` swift
   class StoredProperty {
     var width = 0.0
     var height = 0.0
   }
   
   let stored = StoredProperty()
   stored.width = 123
   stored.height = 456
   stored.width
   stored.height
   ```

   - Lazy Stored Property (지연 속성)

      초기값이 인스턴스의 생성이 완료 될 때까지도 알 수 없는 외부 요인에 의존 할 때

      초기값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때

      필요한 경우가 제한적일 때

   ``` swift
   class BasicStoredProperty {
     var width = 10.0
     var height = 20.0
     
     var area = 200.0
   //  var area = self.width * self.height - 오류 area 가 초기화가 안됬는데 self 를 써서
   }
   
   let basicStored = BasicStoredProperty()
   basicStored.area
   basicStored.width = 30
   basicStored.area
   
   
   class LazyStoredProperty {
     var width = 10.0
     var height = 20.0
     
   // lazy 를 쓰는 경우
   	// 1. 외부 요인이나 다른 설정에 기반
   //  var area = self.width * self.height
     lazy var area = width * height
     
   	// 2. 계산 비용이 많이 드는 상황
   //  var hardWork = "실행하면 약 10초 이상 걸려야 하는 작업"
     
     // 3. 필요한 경우가 제한적인 상황
   //  func ifStatement() {
   //    if true {   // 5%
   //      print(area)
   //    } else {    // 95%
   //      print(width)
   //    }
   //  }
   }
   
   let lazyStored = LazyStoredProperty()
   lazyStored.width = 30
   lazyStored.area
   
   
   // 순서 주의
   let lazyStored1 = LazyStoredProperty()
   lazyStored1.area   // 200 이 저장되어있으면 끝남
   lazyStored1.width = 30
   lazyStored1.area // 여기도 200 이 나온다.
   ```

   - Computed Property (계산 속성)

     ​	자료를 저장하지 않고 매번 호출할 때마다 새로 계산

   ```swift
   /* 형식
     var variable name: type {
         get {
             statements
         }
         set {
             variable name = newValue
         }
     }
    */
   
   class ComputedProperty {
     var width = 5.0
     var height = 5.0
     
     lazy var lazyArea = width * height
     var area: Double { // 하나만 있을때는 get 생략 가능
       width * height
     }
     
     // Stored + Computed get(read), set(write)
     private var _koreanWon = 0.0
     var wonToDollar: Double {
       get {
         return _koreanWon / 1136.5
       }
       set {
         // newValue: 새로 들어오는 값
         _koreanWon = newValue // 여기에 밑에서 10000을 넣은값이 들어간다. 
       }
     }
   }
   
   var computed = ComputedProperty()
   computed.area
   computed.lazyArea
   
   computed.width = 10
   computed.area
   computed.lazyArea
   
   computed.lazyArea = 50.0
   computed.lazyArea
   
   computed.width = 20
   computed.height = 20
   computed.area
   computed.lazyArea
   
   computed.wonToDollar
   computed.wonToDollar = 10000
   computed.wonToDollar
   ```

   - Property Observer (속성 옵저버)

   ```swift
   /* 형식
    var variable name: type = value {
        willSet {
            statements
        }
        didSet {
            statements
        }
    }
    */
   
   class PropertyObserver {
     var height = 0.0
     
     var width = 0.0 {
       willSet {
         print("willSet :", width, "->", newValue)
         // width = 0.0,  newValue = 50.0
       }
       
       // 변경되는 시점  willSet <-> didSet 중간
       
       didSet {
         height = width / 2
         print("didSet :", oldValue, "->", width)
         // oldValue = 0.0,  width = 50.0
       }
     }
   }
   
   var obs = PropertyObserver()
   obs.height = 50
   obs.width = 50 
   ```

   - Type Property (타입 속성)

   ``` swift
   /*
    선언 - static let(var) propertyName: Type
          class var propertyName: Type { return 
   					code }
    사용 - TypeName.propertyName
    
    static: override 불가
    class: 클래스에서만 사용 가능하고 computed property 형태로 사용. 서브클래스에서 override 가능
    */
   
   class TypeProperty {
     static var unit: String = "cm"
     var width = 5.0
   }
   
   let square = TypeProperty()
   square.width
   
   let square1 = TypeProperty()
   square1.width = 10.0
   square1.width
   
   TypeProperty.unit
   print("\(square.width) \(TypeProperty.unit)")
   print("\(square1.width) \(TypeProperty.unit)")
   
   TypeProperty.unit = "m"
   print("\(square.width) \(TypeProperty.unit)")
   print("\(square1.width) \(TypeProperty.unit)")
   ```

4. **Equatable, Identical**

   ``` swift
   // 동등 연산자
   1 == 1
   2 == 1
   "ABC" == "ABC"
   
   
   class Person {
     let name = "이순신"
     let age = 30
   }
   
   let person1 = Person()
   let person2 = Person()
   
   //person1 == "이순신"    // person1 은 name 하고 age 둘다 가지고있다. 
   //person1 == person2   // 뭘 비교해야할지 알려준게 없다. name 을 비교해야할지 둘다 비교해야할지
   ```

   - Equatable Protocol 

   ```swift
   class User: Equatable {
     var name = "이순신"
     let age = 30
     
     static func == (lhs: User, rhs: User) -> Bool {
       return lhs.name == rhs.name
     }
   }
   
   let user1 = User()
   var user2 = User()
   user1 == user2
   ```

   - Identical 

   ```swift
   user1.name
   user2.name
   user1 == user2
   user1 === user2 // 메모리 저장과 관련있다. 서로 다른 메모리에 저장되어있으니 다르다. 서로 다른 메모리에 저장된 서로 다른 객체이다. 
   
   /*
    Value Type => struct, enum  (Stack 에 저장) - 크기가 정해져 있는것을 저장하는것 
    Reference Type => class  (Heap 에 저장) - 자유롭게 메모리를 할당. 크기도 모를때 유동적으로 메모리를 사용할때
    */
   
   /*
    let x = 5
    let y = User()
    let z = User()
    
              x   y        z
    [ Stack ] | 5 | 0x5F17 | 0x2C90 |
                      |        |
                      ---------|----------
              ------------------         |
              |                          |
            0x2C90          0x5F16     0x5F17
    [ Heap ]  | z's user data | SomeData | y's user data |
    
    --- in Memory ---
    값 타입(Value Type) - Stack
    참조 타입(Reference Type) - Stack -> Heap
    */
   
   
   user1.name = "홍길동"
   user1.name   //
   user2.name   //
   user1 == user2
   user1 === user2
   
   
   user2 = user1
   
   // user1 -> 0x00001  <- user2       0x00002
   
   //user1.name
   //user2.name
   //user1 == user2    // true
   //user1 === user2   // -> 동일한 위치의 데이터를 가지고있으니까 ture
   
   //user2.name = "세종대왕"
   //user2.name
   //user1.name
   
   
   /*
    Identity Operators
    === : 두 상수 또는 변수가 동일한 인스턴스를 가르키는 경우 true 반환. 참조 타입에만 사용한다. 
    */
   
   //1 === 1  false 값 타입에는 사용하지 않는다. 
   //"A" === "A" false 
   
   // 5 == 5 true 
   
   ```

   


