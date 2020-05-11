# ARC(Automatic Reference Counting)

---

### Contents

1. ARC Basic
2. Scope
3. Strong Reference Cycles
4. Strong, Unowned, Weak

---

### 1. ARC Basic

```swift
class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}
```

- Allocation & Release 

  ```swift
  print("\n---------- [ Case 1 ] ----------\n")
  
  var obj1: Person? = Person(testCase: "case1") // 0x1234 count 1
  obj1 = nil // nil count = 0 , release 가 되면서 count0 이 된다.
  ```

- 참조 카운트 증가 

  ```swift
  print("\n---------- [ Case 2 ] ----------\n")
  
  var obj2: Person? = Person(testCase: "case2") // count 1
  var countUp = obj2   // count 2
  
  obj2 = nil // count 1
  countUp = nil   // count 0
  ```

- Collection 에 의한 참조 카운트 

  ```swift
  print("\n---------- [ Case 3 ] ----------\n")
  var objc4 = Person(testCase: "something") // something = count 1
  var obj3: Person? = Person(testCase: "case3") // case3 = count 1
  var array = [obj3, obj3, objc4]   // something = count 2, case3 = count 3
  
  obj3 = nil  // case3 = count 2
  
  //objc4 = nil // something = count 1
  
  array.remove(at: 2) // something = count 0
  
  array.remove(at: 0) // case3 = count 1
  array.remove(at: 0)  // case3 = count 0
  ```

- 강한 참조, 약한 참조

  - strong : 기본값. 강한 참조. Reference Count 1 증가 
  - unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지 
  - weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경  

  ``` swift
  print("\n---------- [ Case 4 ] ----------\n")
  
  var strongObj4 = Person(testCase: "case4") // count 1
  print(strongObj4)
  
  //weak var weakObj4 = Person(testCase: "case4") // count 0, Person 이 유지되지 않는다. 만들자 마자 바로 해제된다.
  //print(weakObj4)
  
  //unowned var unownedObj4 = Person(testCase: "case4") // 오류 발생, count 0, Person이 만들어지자마자 해제, 0x1234 만들어졌는데 Person 이 없는데 0x1234 주소로 접근을 하니까 에러가 난다.
  //print(unownedObj4)
  
  ```

  ``` swift
   다음 4줄의 코드 중 사용 불가능한 것은?
  
  unowned let unownedLet = strongObj4
  unowned var unownedVar = strongObj4
  weak let weakLet = strongObj4. // 안된다. weak 은 값이 있을수도 있고 없을수도 있고 nil 일수도 있는데 let 은 고정값이어야 한다. 밑에 처럼 weak 일때는 var 로 해줘야 한다.
  weak var weakVar = strongObj4
  ```

  ---

  ### 2. Scope

  - 스코프 범위에 의한 할당 및 해제 

  ```swift
  class LocalScope {
    func doSomething() {}
    deinit {
      print("LocalScope is being deinitialized")
    }
  }
  
  class ClassProperty {
    func doSomething() {}
    deinit {
      print("ClassProperty is being deinitialized")
    }
  }
  
  class Application {
    var prop = ClassProperty()
    
    func allocateInstance() {
      let local = LocalScope() // count 1
      local.doSomething()
  
      // local - count 0
    }
    
    deinit {
      print("Application is being deinitialized")
    }
  }
  
  // 아래의 코드 실행시 출력되는 메세지는?
  var app: Application? = Application()
  app?.prop.doSomething()
  app?.allocateInstance()
  
  // ClassProperty 객체의 deinit 메서드가 호출되려면 어떻게 할까요? 
  app = nil 
  ```

  ---

  ### 3. Strong Reference Cycles 

  ```swift
  class Person {
    var pet: Dog?
    func doSomething() {}
    deinit {
      print("Person is being deinitialized")
    }
  }
  
  class Dog {
    var owner: Person?
    func doSomething() {}
    deinit {
      print("Dog is being deinitialized")
    }
  }
  
  var giftbot: Person? = Person() // count 1
  var tory: Dog? = Dog()  // count 1
  
  giftbot?.pet = tory // Dog = count 2
  tory?.owner = giftbot // Person = count 2
  
  // 이렇게 해도 메모리에서 해제가 안된다.
  //giftbot  = nil   -> Person = count 1
  //tory = nil       -> Dog = count 1
  
  // Question : 두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까?
  
  // 순서 주의
  // 안에 있는 것을 nil 로 만들어줘서 줄여주고
  giftbot?.pet = nil  // Dog = count 1
  tory?.owner = nil  // Person = count 1
  
  giftbot = nil  // Person = count 0
  tory = nil  // Dog =  count 0
  ```

  ---

  ### 4. Strong, Unowned, Weak 

  ```swift
  class Teacher {
    var student: Student?
    deinit {
      print("Teacher is being deinitialized")
    }
  }
  
  class Student {
    // strong, unowned, weak
    let teacher: Teacher
  //  unowned let teacher: Teacher
  //  weak var teacher: Teacher?
    
    init(teacher: Teacher) {
      self.teacher = teacher
    }
    deinit {
      print("Student is being deinitialized")
    }
  }
  
  var teacher: Teacher? = Teacher() // Strong 일때 (T - count 1)
  var student: Student? = Student(teacher: teacher!)  // Strong 일때 (S - count 1 T - count 2) (unowned 로 할때는 T - 1 그대로
  teacher?.student = student // S - count 2
  
  
  print("\n---------- [ teacher release ] ----------\n")
  // teacher = nil  // release 가 안된다.
  teacher?.student = nil
  teacher = nil
  
  
  // teacher = nil  - T - count 0, S - count 1 ( unowned 일때)
  
  print("\n---------- [ student release ] ----------\n")
  // student = nil // release 가 안된다.
   
  student = nil
  
  // student = nil  - S - count 0 ( unowned 일때)
  
  //1) strong  : 명시적으로 nil 대입 필요. teacher?.student = nil
  //2) unowned : 자동으로 deinit. nil 처리 된 속성에 접근하면 런타임 에러 발생
  //3) weak    : 자동으로 deinit. nil 처리 된 속성에 접근하면 nil 반환
  ```

---

# Struct 

---

### 1. Comparing Structures and Classes 

클래스와 구조체 공통점 

- 값을 저장하기 위한 프로퍼티
- 기능을 제공하기 위한 메서드 
- 초기 상태를 설정하기 위한 생성자 
- 기본 구현에서 기능을 추가하기 위한 확장(Extension)
- 특정 값에 접근할 수 있는 첨자 (Subscript)
- 특정한 기능을 수행하기 위한 프로토콜 채택
- Upper Camel Case 사용

``` swift
class SomeClass {
  var someProperty = 1
  func someMethod() {}
}
struct SomeStruct {
  var someProperty = 1
  func someMethod() {}
}

let someClass = SomeClass()
let someStruct = SomeStruct()
```

클래스만 제공하는 기능 

- 상속 (Inheritance)
- 소멸자(Deinitializer)
- 참조 카운트 (Reference Counting)

```Swift
// 상속
struct ParentS {}
//struct Child: Parent {}   // 오류

// 소멸자
struct Deinit {
//  deinit { }    // 오류
}

// 참조 카운트(Reference Counting)  X

```

### 2. 값 타입 VS 참조 타입 

```swift
class Dog {
  var name = "토리"
}
struct Cat {
  var name = "릴리"
}

let dog = Dog()
let cat = Cat()

//dog.name = "릴리"
//cat.name = "토리" - 오류 ( stack 에 있는 고정된 값은 바꿀수 없다.)

let dog1 = dog // class 는 let 으로 해도 상관없지만
var cat1 = cat  // struct 는 var  로 해야한다.
dog1.name = "뽀삐"
cat1.name = "뽀삐"
dog.name
cat.name
dog1.name
cat1.name

//dog === dog1  ( 주소값비교)
//cat === cat1 ( 오류 , 힙을 사용하지 않는 값 타입 이니까 오류가 발생한다.)
```

### 생성자 비교

```swift
/*
 var로 선언된 변수
 */

class UserClass1 {
  var name = "홍길동"
}
struct UserStruct1 {
  var name = "홍길동"
}

// 생성자가 따로 제공되지 않는다. 이미 다 초기화 되어있어서
let userC1 = UserClass1()

// 구조체는 생성자를 제공해준다
let userS1_1 = UserStruct1()
let userS1_2 = UserStruct1(name: "깃봇")
userS1_1.name // 홍길동
userS1_2.name // 깃봇
```

```swift
/*
 프로퍼티에 초기화 값이 없을 때
 */

class UserClass2 {
  var name: String
  // 초기화 메서드 없으면 오류, 꼭 해줘야한다.
  init(name: String) { 
    self.name = name 
  }
}

struct UserStruct2 {
  var name: String
  var age: Int
  
  // 초기화 메서드 자동 생성
  // 단, 생성자를 별도로 구현했을 경우 자동 생성하지 않음
//  init(name: String) {
//    self.name = name
//    self.age = 10
//  }
}

let userC2 = UserClass2(name: "홍길동")
let userS2 = UserStruct2(name: "홍길동", age: 10) // 아무런 생성자를 위에서 생성 안했는데 바로 쓸수있다.

```

``` swift
/*
 저장 프로퍼티 중 일부에만 초기화 값이 있을 때
 */

class UserClass3 {
  let name: String = "홍길동"
  // 저장 프로퍼티 중 하나라도 초기화 값이 없는 경우 생성자를 구현해야 함
//  let age: Int
}

struct UserStruct3 {
  let name: String = "홍길동"
  let age: Int
}
// 초기화 값이 없는 저장 프로퍼티에 대해서만 생성자로 전달 , name 은 let 으로 생성해서 바꿀수 없지만 age 에 대한 생성자가 생성된다.
let userS3 = UserStruct3(age: 10)
```

```swift
/*
 지정(Designated) 생성자, 편의(Convenience) 생성자
 */
class UserClass4 {
  let name: String
  let age: Int
    
  // 지정 생성자에서는 모든 저장 프로퍼티를 초기화 해야 함
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
    
    // 편의 생성자는 일부만 초기화하고 다른 생성자를 호출 가능
  convenience init(age: Int) {
    self.init(name: "홍길동", age: age)
  }
}

// 구조체

struct UserStruct4 {
  let name: String
  let age: Int
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  // Convenience 키워드 사용 X , 지정과 편의 생성자 별도 구분 없음, 아무곳에서나 다른 생성자를 불러올수 있다.
//  convenience init(age: Int) {
  init(age: Int) {
    self.init(name: "홍길동", age: age)
  }
}

// 따라서 extension에서도 생성자 추가 가능.  상속(Inheritance) - 수직확장 , 확장(Extension) - 수평확장
extension UserStruct4 {
  init(name: String) {
    self.name = name
    self.age = 10
  }
}

let userS4_1 = UserStruct4(name: "홍길동")
let userS4_2 = UserStruct4(age: 20)

```

### 프로퍼티 변경

```Swift
struct PointStruct {
  var x = 0
  
//  mutating func updateX() {   스택에 있는 값을 바꿔줄때는 mutating 을 해줘야한다. (함수일때)
//    self.x = 5
//  }

//  var updateProperty: Int {
//    get { x }
//    set { x = newValue }    // 연산 프로퍼티의 setter는 기본적으로 mutating
//  }
}


//var p2 = PointStruct()
//p2.updateX()
//p2.updateProperty = 3
//p2.updateProperty




class PointClass {
  var x = 0
  
//  mutating
  func updateX() {
    self.x = 5
  }
}

let p1 = PointClass()
p1.updateX()
```


