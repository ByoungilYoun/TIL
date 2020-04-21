# Access Control 

---

## **Contents**

- Access Control 
- Getters and Setters

---

1. Access Control 
   - open
   - public 
   - internal
   - fileprivate
   - private

``` swift
/***************************************************
 Open / Public
 ***************************************************/

open class SomeOpenClass {
  open var name = "name"
  public var age = 20
}

public class SomePublicClass {
  public var name = "name"
  var age = 20
}

let someOpenClass = SomeOpenClass()
someOpenClass.name
someOpenClass.age

let somePublicClass = SomePublicClass()
somePublicClass.name
somePublicClass.age

/***************************************************
 Internal (기본값 - 생략할수있다.)
 ***************************************************/

internal class SomeInternalClass {
  internal var name = "name"
  internal var age = 0
}
// 위에것을 생략하면 
//class SomeInternalClass {
//  var name = "name"
//  var age = 0
//}


let someInternalClass = SomeInternalClass()
someInternalClass.name
someInternalClass.age

/***************************************************
 fileprivate (선언한 같은 파일 내에서 사용 가능 )
 ***************************************************/

class SomeFileprivateClass {
  fileprivate var name = "name"
  fileprivate var age = 0
}

let someFileprivateClass = SomeFileprivateClass()
someFileprivateClass.name
someFileprivateClass.age

// private 
class SomePrivateClass {
  private var name = "name"
  private var age = 0
  
  func someFunction() {
    print(name)
  }
}

//let somePrivateClass = SomePrivateClass()
//somePrivateClass.someFunction()
//somePrivateClass.name -실행 안됨
//somePrivateClass.age - 실행 안됨

```

- Nested Types
  - Private -> Fileprivate
  - Fileprivate -> Fileprivate
  - Internal -> Internal
  - Public -> Internal
  - Open -> Internal

``` swift
// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// public도 동일
open class OClass {
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// 더 높은 레벨을 설정할 수는 있지만,
// 애초에 클래스 자체에 접근할 수 있는 레벨이 낮으므로 의미 없음
internal class IClass {
  open var openProperty = 0
  public var publicProperty = 0
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
fileprivate class FClass {
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
private class PClass {
  var someProperty: Int = 0
}
```

2. **Getter and Setters**

   - Getter 와 Setter 는 그것이 속하는 변수, 상수 등에 대해 동일한 접근 레벨을 가짐

      이 때 Getter 와 Setter 에 대해서 각각 다른 접근 제한자 설정 가능

```swift
/***************************************************
 Setter 설정
 ***************************************************/

class TrackedString {
//  var numberOfEdits = 0

//  private var numberOfEdits = 0
  private(set) var numberOfEdits = 0 // 외부에서는 못바꾸게 하고 내부에서만 바꿀수 있게 해주는 

  var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
}

let trackedString = TrackedString()
trackedString.numberOfEdits
trackedString.value = "This string will be tracked."
trackedString.numberOfEdits

trackedString.value += " This edit will increment numberOfEdits."
trackedString.numberOfEdits

trackedString.value = "value changed"
trackedString.numberOfEdits

//trackedString.numberOfEdits = 0
//trackedString.numberOfEdits


/***************************************************
 Getter 와 Setter 에 대해 각각 명시적으로 표현
 ***************************************************/

public class TrackedString1 {
  internal private(set) var numberOfEdits = 0
  
  public var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
  
  public init() {}
}
```

---

# OOP 4대 특성

---

## Contents

- Abstraction
- Encapsulation
- Inheritance
- Polymorphism

---

1. **Abstraction(추상화)**
   - 대상의 불필요한 부분을 무시하여 복잡성을 줄이고 목적에 집중할 수 있도록 단순화 시키는 것 (디자인 레벨)
   - 사물들 간의 공통점만 취하고 차이점을 버리는 일반화를 통한 단순화
   - 중요한 부분의 강조를 위해 불필요한 세부 사항을 제거하는 단순화
   - 관심 영역 = 도메인 = 컨텍스트 /  추상화 = 모델링 = 설계 
   - 추상화는 대상에 대한 관점과 사용 목적에 따라 달라질 수 있음

``` swift
protocol Human {
  var name: String { get }
  var age: Int { get }
  var gender: String { get }
  var height: Double { get }
  
  func sleep()
  func eat()
  func walk()
}

//class User: Human {
//}


protocol Jumpable {
  var canJump: Bool { get set }
  var jumpHeight: Double { get }
}


class Cat: Jumpable {
//  let canJump = true  // get을 쓰려면 let 으로 가능(최소한)
  var canJump = true  // get set 둘다 쓰려면 var 사용해야한다.

  private var _jumpHeight = 30.0
  var jumpHeight: Double {
    get { _jumpHeight }
//    set { _jumpHeight = newValue }
  }
}

let cat = Cat()
if cat.canJump {
  print(cat.jumpHeight)
}
```

2. **Encapsulation(캡슐화)**
   - 객체가 독립적으로 자신의 상태와 역할을 책임지고 수행할 수 있도록 자율성 부여
   - 접근 제한자(private)를 이용해 데이터를 외부로부터 보호하여 무결성을 강화하고 변화에 유연하게 대응
   - 자세히 몰라도 되는 내부 동작방법을 숨기고 사용하는 방법만을 외부로 노출
   - 외부에서 요청을 전달하면 수신 객체는 '어떻게' 처리할 지를 결정. 외부에서 그 내용을 자세히 알 필요 없음

```swift
class 회사 {
  let 직원1: 직원 = 직원()
  let 직원2: 직원 = 직원()
}
class 직원 {
  private func 밤샘() {}
  private func 코피() {}
  
  func 결과물산출() {}
}

let company = 회사()
company.직원1.결과물산출()
company.직원2.결과물산출()
```

3. **Inheritance(상속)**
   - 하나의 클래스의 특징(부모 클래스)을 다른 클래스가 물려받아 그 속성과 기능을 동일하게 사용하는 것.
   - 범용적인 클래스를 작성한 뒤 상속을 이용해 중복되는 속성과 기능을 쉽게 구현 가능
   - 주요 목적 : 재사용과 확장(상속은 수직 확장, Extension 은 수평확장)
   - 부모 클래스와 자식 클래스는 IS - A 관계. 

```swift
class Cat {
  let leg = 4
  
  func cry() {
    print("miaow")
  }
}

let cat = Cat()
print(cat.leg)
cat.cry()


class KoreanShortHair: Cat {
  let color: String = "black"
}

let koshort = KoreanShortHair()
koshort.leg
koshort.cry()

koshort.color
//cat.color
```

- Final 

``` swift
class Shape {
}

final class Circle: Shape {
}
// final 을 붙어있으면 그 값은 상속을 못한다. 
//class Oval: Circle {
//} - 상속 불가
```

4. **Polymorphism(다양성)**
   - 다양한 형태로 나타날 수 있는 능력/ 여러 형태를 가진다는 의미의 그리스어에서 유래
   - 동일한 요청에 대해 각각 다른 방식으로 응답할 수 있도록 만드는 것
   - 오버라이딩(상속과 관련)과 오버로딩(상속과 무관)이 있으며 언어에 따라 오버라이딩만 지원하기도 함

1) 오버라이딩(Overriding)

- 상위 클래스에서 상속 받은 메서드를 하위 클래스에서 필요에 따라 재정의하는 것

- 동일 요청이 객체에 따라 다르게 응답

  ```swift
  class Rectangle: Shape {
    var cornerRadius: Double
    
    // 저장 프로퍼티 X 
  //  override var color: UIColor  = .green
    
    // 계산 프로퍼티 O
    override var color: UIColor {
      get { super.color }
      set { super.color = newValue }
    }
    override var title: String {
  //    get { "Rectangle" }
      get { super.title + " => Rectangle" }
      set { super.title = newValue }
    }
    
    init(color: UIColor, cornerRadius: Double = 10.0) {
      self.cornerRadius = cornerRadius
      super.init(color: color)
    }
  }
  
  let rect = Rectangle(color: UIColor.blue)
  rect.color
  rect.color = .yellow
  rect.color
  
  rect.cornerRadius
  rect.lineWidth
  rect.draw()
  
  shape.title
  rect.title
  
  
  class Triangle: Shape {
    override func draw() {
      super.draw()   // <- 부모가 가진 메서드 호출
      print("draw triangle")
    }
  }
  
  let triangle = Triangle(color: .gray)
  triangle.title
  triangle.lineWidth
  triangle.color
  
  triangle.draw()
  ```

2) 오버로딩(Overloading)

 - 동일한 이름의 메서드가 매개 변수의 이름,타입, 개수 등의 차이에 따라 다르게 동작하는 것

 - 동일 요청이 매개 변수에 따라 다르게 응답

 - 다른 파라미터 이름, 다른 파라미터 타입, 다른 파라미터 개수

   ``` swift 
   func printParameter() {
     print("No param")
   }
   
   //func printParameter() -> String {   // Error - 함수의 이름이 같다. 위 메서드와 둘중 뭘 실행해야할지 																									모른다.
   //  "No param"
   //}
   
   func printParameter(param: Int) {
     print("Input :", param)
   }
   
   func printParameter(_ param: Int) {
     print("Input :", param)
   }
   
   printParameter()
   printParameter(param: 1)
   printParameter(1)
   
   
   func printParameter(param: String) {
     print("Input :", param)
   }
   
   func printParameter(_ param: String) {
     print("Input :", param)
   }
   
   func printParameter(name param: String) {
     print("Input :", param)
   }
   //func printParameter(param name: String) {   // Error - 첫번째꺼랑 똑같다. 구분 불가능
   //  print("Input :", name)
   //}
   printParameter(param: "hello")
   printParameter("hello")
   printParameter(name: "Hello")
   
   func printParameter(param: String, param1: String) {
     print("Input :", param, param1)
   }
   
   func printParameter(_ param: String, _ param1: String) {
     print("Input :", param, param1)
   }
   
   func printParameter(_ param: String, param1: String) {
     print("Input :", param, param1)
   }
   
   func printParameter(param: String, _ param1: String) {
     print("Input :", param, param1)
   }
   
   printParameter("hello", "world")
   printParameter("hello", param1: "world")
   printParameter(param: "hello", "world")
   
   ```

   


