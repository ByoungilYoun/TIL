# Type Casting

- Type Check
- Type Casting

---

## 1. Type Check

- 타입 확인 - type(of: )

  ``` swift
  type(of: 1)
  type(of: 2.0)
  type(of: "3")
  
  // Any ( 런타임 때의 결과를 반환)
  let anyArr: [Any] = [1, 2.0, "3"]
  type(of: anyArr[0])
  type(of: anyArr[1])
  type(of: anyArr[2]) 
  
  
  // Generic
  func printGenericInfo<T>(_ value: T) {    // < >안에 있는 값이랑 value : 뒤에 있는 값이랑 같아야한																							다. 
    let types = type(of: value)
    print("'\(value)' of type '\(types)'")
  }
  printGenericInfo(1)
  printGenericInfo(2.0)
  printGenericInfo("3")
  ```

- 타입 비교 - is

  ``` swift
  //객체 is 객체의 타입 -> Bool (true or false)
  //1)
  let number = 1
  number == 1    // 값 비교
  number is Int  // 타입 비교
  //2)
  let strArr = ["A", "B", "C"]
  
  if strArr[0] is String {
    "String"
  } else {
    "Something else"
  }
  if strArr[0] is Int {
    "Int"
  }
  //3)
  let someAnyArr: [Any] = [1, 2.0, "3"]
  
  for data in someAnyArr {
    if data is Int {
      print("Int type data :", data)
    } else if data is Double {
      print("Double type data : ", data)
    } else {
      print("String type data : ", data)
    }
  }
  ```

- 상속 관계

  ``` swift
  class Human {
    var name: String = "name"
  }
  class Baby: Human {
    var age: Int = 1
  }
  class Student: Human {
    var school: String = "school"
  }
  class UniversityStudent: Student {
    var univName: String = "Univ"
  }
  
  let student = Student()
  //student is Human - true (자식 클래스 is 부모 클래스 - 항상 true 가 나온다.)
  //student is Baby - false  
  //student is Student - true 
  
  let univStudent = UniversityStudent()
  //student is UniversityStudent - false 
  //univStudent is Student
  
  /*
   자식 클래스 is 부모 클래스  -> true
   부모 클래스 is 자식 클래스  -> false
   */
  
  let babyArr = [Baby()]
  type(of: babyArr) // 베이비 타입
  
  // Q. 그럼 다음 someArr 의 Type 은?
  let someArr = [Human(), Baby(), UniversityStudent()]
  type(of: someArr) // -> 에러가 안난다 -> 공통점이 있다. -> Human 타입 let someArr : [Human] = ~
  
  //someArr[0] is Human    // -> true
  //someArr[0] is Student  // -> false 
  //someArr[0] is UniversityStudent  // -> false 
  //someArr[0] is Baby     // -> false 
  
  //someArr[1] is Human    // -> true	
  //someArr[1] is Student  // -> false 
  //someArr[1] is UniversityStudent  // -> false 
  //someArr[1] is Baby     // -> true
  
  //someArr[2] is Human    // -> true
  //someArr[2] is Student  // -> true
  //someArr[2] is UniversityStudent  // -> true
  //someArr[2] is Baby     // -> false 
  
  var human: Human = Student()
  type(of: human) // -> student 타입 차이점 : 
  
  // Q. human 변수의 타입, name 속성의 값, school 속성의 값은?
  //human.name     -> name 
  //human.school   -> error 
  // Q. Student의 인스턴스가 저장된 human 변수에 다음과 같이 Baby의 인스턴스를 넣으면?
  //human = Baby()  -> error
  //human = UniversityStudent()
  
  // 부모 클래스 타입은 자식 클래스 타입을 가질 수 있음
  var james = Student()
  james = UniversityStudent()
  
  // Q. 다음 중 james 가 접근 가능한 속성은 어떤 것들인가
  //james.name     // Human 속성 -> 가능
  //james.age      // Baby 속성 -> 불가능 
  //james.school   // Student 속성 -> 가능 
  //james.univName // UniversityStudent 속성 -> 불가능 (실제 타입은 student 라서 불가능)
  
  // Q. 그럼 Student 타입인 james 객체가 univName을 사용할 수 있도록 하려면 뭘 해야 할까요
  // if let james = james as? UniversityStudent {
  // james.univName 
  //}
  ```

## 2. Type Casting

- as : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
- as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
- as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생

```swift
import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}
```

- Upcasting

  - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
  - 업캐스팅은 항상 성공하며 as 키워드를 사용 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)

  ``` swift
  // Shape - black, Rectangle - white
  
  let rect = Rectangle()
  rect.color
  rect.cornerRadius
  
  let t1 = rect as Shape // 타입은 shape 
  let t2 = rect as Rectangle // 타입은 rectangle
  
  //(rect as Shape).color -> white 가 나온다. 
  //(rect as Shape).cornerRadius -> error (shape 타입은 corner.Radius 가 없다.)
  
  //(rect as Rectangle).color == rect.color
  //(rect as Rectangle).cornerRadius == rect.cornerRadius
  
  let upcastedRect: Shape = Rectangle() // 타입은 Rectangle
  type(of: upcastedRect)   
  
  //upcastedRect.color -> white
  //upcastedRect.cornerRadius -> error (컴파일 타임으로 해석)
  
  //(upcastedRect as Shape).color -> white
  //(upcastedRect as Rectangle).color -> error (as! 을 써야한다. 부모 클래스나 자기 자신한테만 쓸수있다)
  
  //부모 클래스 타입으로는 항상 변경할 수 있는데, 자식 클래스로 변경할 수는 없는 이유?
  //자식 클래스 타입 <= 부모 크래스 타입 -> 항상 성공하는게 아니다. 
  //자식 클래스 타입 => 부모 크래스 타입 -> 무조건 성공
  ```

- Downcasting

  - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
  - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용

  ```swift
  let shapeRect: Shape = Rectangle()
  var downcastedRect = Rectangle()
  
  //downcastedRect = shapeRect // -> error 부모타입을 자식 타입에 넣는거는 자식 타입이 더 많은 값을 가지고 있을수 있으니까 
  //downcastedRect = shapeRect as Rectangle -> error (as는 자기 자신이나 부모클래스로 변환할때만 쓸수있있다.)
  
  //downcastedRect: Rectangle = shapeRect as? Rectangle  // 변환이 실패하면 nil, 성공하면 optional(rectangle) 타입
  //downcastedRect = shapeRect as! Rectangle  // -> 잘 실행 됨 
  
  //as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
  //as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
  
  //Q. 아래 value 에 대한 Casting 결과는?
  let value = 1
  //(value as Float) is Float   // error -> Int 와 Float 는 관련이 없다. 
  //(value as? Float) is Float  // false -> nil is Float 
  //(value as! Float) is Float  //  error -> 런타임 오류 
  ```

- Type Check Operator 

  ```swift
  let shape = Shape()
  let rectangle = Rectangle()
  let triangle = Triangle()
  
  let list = [shape, rectangle, triangle]
  type(of: list)  // 에러가 안나면 공통적인 타입이 있다는 거다. 공통인 것은 shape 밖에 없다. 즉 타입은 Array<Shape>
  
  for elem in list {
    if elem is Shape {
      print("shape instance")
    } else if elem is Rectangle {
      print("rect instance")
    } else if elem is Triangle {
      print("triangle instance")
    }
  }
  // -> shape instance 가 3번 나온다. 
  
  반대로 
  for elem in list {
    if elem is Triangle {
      print("triangle instance")
    } else if elem is Rectangle {
      print("rect instance")
    } else {
      print("shape instance")
    }
  }
  // shape instance
  // rect instance
  // triangle instance
  
  // let list: [Shape] = [shape, rectangle, triangle]
  for element in list  {
    element.draw()
  }
  // draw shape 
  // draw rect 
  // draw triangle 
  // 컴파일 때는 shape 으로 인식하겠지만 런타임을 하면 각각 따로 for 문이 돌아가면서 배치
  ```

