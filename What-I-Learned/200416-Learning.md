# Enumerations and Optionals

---

## Contents

1. Enumerations 
2. Optionals

---

### 1. Enumerations

- 연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능

```swift
// 형식
enum CompassPoint {
  case north
  case south
  case east
  case west
}

// 열거형 타입의 이름은 Pascal Case
// 각각의 case는 Camel Case
var directionToHead1 = CompassPoint.west
directionToHead1 = .east

var directionToHead2: CompassPoint = .north

// 한줄에  
enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}


```

- Matching Enumeration Values 

  ``` swift
  let directionToHead = CompassPoint.south
  
  switch directionToHead {
  case .north:
    print("Lots of planets have a north")
  case .south:
    print("Watch out for penguins")
  case .east:
    print("Where the sun rises")
  case .west:
    print("Where the skies are blue")
  }
  
  ```

  ```swift
  enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
  }
  
  let enumTypeAnnotation: Planet = .mars
  let somePlanet = Planet.earth
  
  switch somePlanet {
  case .earth:
    print("Mostly harmless")
  default:
    print("Not a safe place for humans")
  }
  ```

- Associated Values (연관값)

  ``` swift
  enum OddOrEven {
    case odd(Int)
    case even(Int)
  }
  
  //// 연관된 값을 넣어준다. 
  var number = OddOrEven.even(20)
  number = OddOrEven.odd(13)
  
  number
  type(of: number)
  
  switch number {
  case .odd(let x):
      print("홀수 :", x)
  case .even(let x):
      print("짝수 :", x)
  }
  
  // let 을 미리 밖에 선언해줄때 ( 파라미터가 많을 때) 위와 결과는 같다. 
  //switch number {
  //case let .odd(x):
  //    print("홀수 :", x)
  //case let .even(x):
  //    print("짝수 :", x)
  //}
  
  // 연관값을 여러개 넣을 수도 있다. 
  enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
  }
  
  var productBarcode = Barcode.upc(8, 85909, 51226, 3)
  productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
  
  productBarcode
  type(of: productBarcode)
  
  
  switch productBarcode {
  case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
  case let .qrCode(productCode):
    print("QR code: \(productCode).")
  }
  
  ```

- Raw Value 

  - Strings, Characters, or any of the Integer or Floating-point number types
  - raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.

  ```swift
  enum Weekday: Int {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
  }
  Weekday.wednesday
  Weekday.wednesday.rawValue
  
  
  enum WeekdayName: String {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
  }
  WeekdayName.monday
  WeekdayName.monday.rawValue //string 으로 했을때는 문자열 그대로 바뀐다. 
  
  
  // 값을 직접 지정 해줄수도 있다. 
  enum Gender: String {
    case male = "남자", female = "여자", other = "기타"
  }
  Gender.male
  Gender.male.rawValue
  
  ```

- Implicitly Assigned Raw Values

  ``` swift
  enum WeekdayAgain: Int {
    case sunday = 5, monday, tuesday, wednesday, thursday, friday, saturday
    //case sunday, monday = 100, tuesday = 101, wednesday, thursday, friday, saturday - monday는 0 이 된다. 
    //  case sunday = 1, monday = 1, tuesday = 2, wednesday, thursday, friday, saturday - 오류 : rawvalue 는 고유값이여야 한다. 
  }
  
  WeekdayAgain.sunday
  WeekdayAgain.sunday.rawValue
  
  WeekdayAgain.wednesday
  WeekdayAgain.wednesday.rawValue 
  
  
  enum WeekdayNameAgain: String {
    case sunday, monday = "mon", tuesday = "tue", wednesday, thursday, friday, saturday
  }
  
  WeekdayNameAgain.tuesday
  WeekdayNameAgain.tuesday.rawValue
  
  WeekdayNameAgain.wednesday
  WeekdayNameAgain.wednesday.rawValue // 지정 안했으니 "wendesday"
  ```

- Initializing from a Raw Value 

  ``` swift
  enum PlanetIntRaw: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
  }
  
  PlanetIntRaw.venus
  PlanetIntRaw.venus.rawValue
  
  PlanetIntRaw(rawValue: 5)
  PlanetIntRaw(rawValue: 7)
  
  // 없는 값이면 nil 이 나온다. 
  //PlanetIntRaw(rawValue: 0)
  //PlanetIntRaw(rawValue: 15)
  
  // 만약 서버에서 7을 눌러주면 핸드폰에서 작동하는법 
  let positionToFind = 7
  //let positionToFind = 11
  
  if let somePlanet = PlanetIntRaw(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
      print("Mostly harmless")
    default:
      print("Not a safe place for humans")
    }
  } else {
    print("There isn't a planet at position \(positionToFind)")
  }
  ```

- Nested 

  ``` swift
  // enum 안에 함수적용
  enum Device: String {
    case iPhone, iPad, tv, watch
    
    func printType() {
      switch self {
      case .iPad, .iPhone, .tv:
        print("device :", self)
      case .watch:
        print("apple Watch")
      }
    }
  }
  
  let iPhone = Device.iPhone
  iPhone.printType()
  
  
  // enum 안에 또 다른 enum 을 만들수 있다. 
  enum Wearable {
    enum Weight: Int {
      case light = 1
      case heavy = 3
    }
    // 이 케이스는 wearable 의 케이스들
    case helmet(weight: Weight)
    case boots
    
    func info() -> Int {
      switch self {
      case .helmet(let weight):
        return weight.rawValue * 2
      case .boots:
        return 3
      }
    }
  }
  
  
  let boots = Wearable.boots
  boots.info()
  
  var woodenHelmet = Wearable.helmet(weight: .light)
  woodenHelmet.info()
  
  var ironHelmet = Wearable.helmet(weight: .heavy)
  ironHelmet.info()
  
  ```

- Mutating

  - enum 타입 내부 함수에서 자기 자신의 값을 변경해야 할 경우 mutating 키워드 필요

  ``` swift
  enum Location {
    case seoul, tokyo, london, newyork
    
  //  func travelToLondon() {
  //    self = .london
  //  } -> 이건 오류 이렇게 하면 안된다. 
    
  //  mutating func travelToTokyo() {
  //    self = .tokyo
  //  } -> mutating 사용
    
  //  mutating func travel(to location: Location) {
  //    self = location
  //  }
    
  //  mutating func travelToNextCity() {
  //    switch self {
  //    case .seoul: self = .tokyo
  //    case .tokyo: self = .newyork
  //    case .newyork: self = .london
  //    case .london: self = .seoul
  //    }
  //  }
  }
  
  var location = Location.seoul
  location
  
  //location.travelToTokyo()
  //location
  
  //location.travel(to: .london)
  //location
  
  //location.travelToNextCity()
  //location.travelToNextCity()
  //location.travelToNextCity()
  //location
  ```

---

### 2. Optional

- Optional 은 값이 없을 수 있는(absent) 상황에 사용

- Objective-C 에는 없는 개념

- 옵셔널 타입은 2가지 가능성을 지님

  - 값을 전혀 가지고 있지 않음
  - 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음

  ``` swift
  let possibleNumber = "123"
  var convertedNumber = Int(possibleNumber)
  type(of: convertedNumber)
  
  //type(of: Int("123"))
  //type(of: Int(3.14))
  //type(of: Int(3))
  ```

- Optional Type Declaration 

  ```swift
  /* 형식
   var <#variable name#>: <#Type?#>
   var <#variable name#>: <#Optional<Type>#>
   */
  
  // 두가지 차이점
  var optionalType1: String?   // 자동 초기화 nil. 이 방법을 자주 쓴다.
  var optionalType2: Optional<Int> = nil   // 수동 초기화. (값 또는 nil)
  
  optionalType1
  type(of: optionalType1)
  type(of: optionalType2)
  
  // Valueless state - nil
  var optionalIntInit = Optional<Int>(0)
  var optionalInt: Int? = 0
  type(of: optionalInt)
  
  optionalInt = nil
  optionalInt
  
  // Optional -> NonOptional
  
  //var nonOptional1 = nil -> 오류
  //var nonOptional2: Int = nil -> 오류
  //var nonOptionalType: Int = optionalInt -> 타입이 맞지 않아 오류
  
  
  // Optional <- NonOptional (실행 된다.)
  let nonOptional = 1
  optionalInt = nonOptional
  optionalInt = 100
  
  // 옵셔널은 두가지 경우, 논옵셔널은 한가지 경우 니까 
  // Optional -> NonOptional (X)
  // Optional <- NonOptional (O)
  
  // 각 타입이 가질 수 있는 값의 범위
  // var nonOptionalNumber: Int    // 정수
  // var optionalNumber: Int?      // 정수 or nil
  ```

- Optional Biding and Forced Unwrapping 

  ``` swift
  var convertedNumber: Int? = 123
  
  if convertedNumber != nil {
    // warning + Optional(123)
    print("convertedNumber has an integer value of \(convertedNumber).")
  }
  ```

     - Optional Binding

       ``` swift
       /*
        1) if let <#nonOptional#> = <#OptionalExpression#> {
          <#Code#>
        }
        2) while let <#nonOptional#> = <#OptionalExpression#> {
          <#Code#>
        }
        3) guard let <#nonOptional#> = <#OptionalExpression#> else {
          <#Code#>
        }
        */
       
       let someValue = "100"
       
       if let number = Int(someValue) {
         print("\"\(someValue)\" has an integer value of \(number)")
       } else {
         print("Could not be converted to an integer")
       }
       
       // Optional Binding
       var optionalStr: String? = "Hello, Optional"
       print(optionalStr)
       
       if let optionalStr = optionalStr {
         print(optionalStr)
       } else {
         print("valueless string")
       }
       
       
       // 여러 개의 옵셔널 바인딩과 불리언 조건을 함께 사용 가능
       if let firstNumber = Int("4"),
         let secondNumber = Int("42"),
         firstNumber < secondNumber,
         secondNumber < 100 {
         print("\(firstNumber) < \(secondNumber) < 100")
       }
       
       // 위와 동일한 동작
       if let firstNumber = Int("4") {
         if let secondNumber = Int("42") {
           if firstNumber < secondNumber, secondNumber < 100 {
             print("\(firstNumber) < \(secondNumber) < 100")
           }
         }
       }
       ```

  - Forced Unwrapping 

    ```swift
    /*
     let nonOptional = <#OptionalExpression!#>
     */
    
    if convertedNumber != nil {
    //  print("convertedNumber has an integer value of \(convertedNumber).")
      print("convertedNumber has an integer value of \(convertedNumber!).")
    }
    
    print(convertedNumber)
    print(convertedNumber!)
    
    
    // Forced unwrap of nil value
    
    convertedNumber = nil
    convertedNumber
    //convertedNumber!  -> 값이 nil 인데 ! 써주면 오류
    ```

- IUO (Implicitly Unwrapped Optionals)

  ``` swift
  // Optional
  let possibleString: String? = "An optional string."
  //let forcedString: String = possibleString  // Error
  let forcedString: String = possibleString!
  type(of: possibleString)
  type(of: forcedString)
  
  
  // Implicitly Unwrapped Optional
  // Non Optional 타입인 것처럼 함께 사용 가능
  var assumedString: String! = "An implicitly unwrapped optional string."
  let stillOptionalString = assumedString
  type(of: assumedString)
  type(of: stillOptionalString)
  print(assumedString)
  print(assumedString!)
  // Optional -> NonOptional (x)
  // String? -> String (x)
  // String! -> String(O)
  
  
  let implicitString: String = assumedString
  type(of: implicitString)
  
  //assumedString = nil
  //print(assumedString!)
  
  
  /*
   - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
   - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
   - 프로퍼티 지연 초기화에 많이 사용
   */
  ```

- Nil-coalescing Operator 

  ``` swift
  optionalStr = nil
  
  var result = ""
  if optionalStr != nil {
     result = optionalStr!
  } else {
     result = "This is a nil value"
  }
  print(optionalStr)
  print(result)
  
  // 간소화 ( Nil Coarsing Operation) 
  let anotherExpression = optionalStr ?? "This is a nil value"
  print(optionalStr)
  print(anotherExpression)
  
  
  let optionalInteger: Int? = 100
  let anotherExpression2 = optionalInteger ?? -1
  print(anotherExpression2)
  
  
  // 어디에 쓰일 수 있을까요?
  // Example
  
  let defaultColorName = "red"
  var userDefinedColorName: String?
  // 기본 색상은 레드로 정해놓고 사용자 색상을 먼저 확인하고 없으면 기본 색상으로 표현해준다. 
  var colorNameToUse = userDefinedColorName ?? defaultColorName
  print(colorNameToUse)
  
  userDefinedColorName = "green"
  colorNameToUse = userDefinedColorName ?? defaultColorName
  print(colorNameToUse)
  ```

- Optional Chaining

  ``` swift
  let greeting: [String: String] = [
    "John": "Wassup",
    "Jane": "Morning",
    "Edward": "Yo",
    "Tom": "Howdy",
    "James": "Sup"
  ]
  
  print(greeting["John"])
  print(greeting["John"]?.count) // 앞에가 옵셔널이면 뒤에 놈도 옵셔널형식이 된다. 연동이 된다.
  print(greeting["NoName"])
  
  // Optional Chaining
  print(greeting["John"]?.lowercased().uppercased())
  print(greeting["Alice"]?.lowercased().uppercased())
  
  // Optional Binding
  if let greetingValue = greeting["John"] {
    print(greetingValue.lowercased().uppercased())
  }
  ```

- Optional Function Types

  ``` swift
  func voidFunction() {
    print("voidFunction is called")
  }
  
  //var functionVariable: () -> () = voidFunction
  var functionVariable: (() -> ())? = voidFunction  // 타입이 같으면 변수안에 함수를 넣어줄수 있다. 
  functionVariable?()
  
  functionVariable = nil
  functionVariable?()
  
  
  
  func sum(a: Int, b: Int) -> Int {
    a + b
  }
  sum(a: 2, b: 3)
  
  //var sumFunction: (Int, Int) -> Int = sum(a:b:)
  var sumFunction: ((Int, Int) -> Int)? = sum(a:b:)
  type(of: sumFunction)
  
  //print(sumFunction?(1, 2))
  //print(sumFunction!(1, 2))
  
  //sumFunction = nil
  //sumFunction?(1, 2)
  //sumFunction!(1, 2)
  ```

  


