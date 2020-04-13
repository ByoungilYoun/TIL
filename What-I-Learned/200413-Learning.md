

# The Basics 

---

## Contents

- Conditional Statements
- Tuples
- Loops
- Control Transfer

---

1. **Conditional Statements**

---

- **1)  If Statements**

``` swift
//형식
if condition {
code
}

if condition { 
statements
} else {
statements
}

if condition {
statements 
} else if {
statements
} else {
statements
}
// condition 은 Bool 값 ( ture , false)

```

- Logical And Operator

``` swift
if (temperatureInFahrenheit > 0) && (temperatureInFahrenheit % 2 == 0) {
}

if temperatureInFahrenheit > 0, temperatureInFahrenheit % 2 == 0 {
}
```

- Logical Or Operator 

``` swift
if temperatureInFahrenheit > 0 || temperatureInFahrenheit % 2 == 0 {
}
```

- **2)  Switch Statemens.**

``` swift
// 형식
switch value {
 case value 1:
     respond to value 1
 case value 2,
      value 3:
     respond to value 2 or 3
 default:
     otherwise, do something else
 }

// switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive) 

```

- Compound Cases 

``` swift
// if문은 콤마(,)가 And(&&)연산인 것과 반대로 switch문은 콤마(,)가 Or(||) 연산

let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}

```

- Value binding  

``` swift
// x, y 좌표
let somePoint = (9, 0)

switch somePoint {
case (let distance, 0), (0, let distance):
  print("On an axis, \(distance) from the origin")
default:
  print("Not on an axis")
}
```

- Where clause 

``` swift
let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
  print("(\(x), \(y)) is just some arbitrary point")
}

```

- Fall through 

``` swift
// description 문장뒤에 이어서 붙여주는 예제 
let integerToDescribe = 3
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also"
  fallthrough     // 이렇게 해주면 밑에 "an integer 도 프린트 된다." 즉 한단계 아래까지만 붙여주는 것 
 default:
  description += " an integer."
}
print(description)


```

3)  **Guard Statement** 

``` swift
 guard condition else {
   code
 }
  
 - 조건에 맞지 않으면 바로 종료.
 - 들여쓰기 중첩 방지


```

---

2. **Tuples**

- Unnmaed Tuple 

``` swift
let number: Int = 10

let threeNumbers: (Int, Int, Int) = (1, 2, 5)
type(of: threeNumbers)

threeNumbers

threeNumbers.0
threeNumbers.1
threeNumbers.2

//타입이 달라도 된다. 

var threeValues: (Int, Double, String) = (10,  100.0,  "이름")
type(of: threeValues)

threeValues

threeValues.0 = 5   // 특정 하나의 값을 바꿔야 한다. 
threeValues
```

- Decomposition (분해)

``` swift
let numbers = threeNumbers
numbers
numbers.0
numbers.1

// 각각의 값을 분해하고 싶을때 
let (first, second, third) = threeNumbers
first
second
third


// wildcard pattern (첫번째 값은 필요없을때 _ 를 붙여준다.)

let (_, second1, third1) = threeNumbers
second1
third1
```

- Named Tuple 

``` swift
//let iOS = (language: "Swift", version: "5")

//let iOS: (language: String, version: String) = (language: "Swift", version: "5")
//let iOS: (language: String, version: String) = ("Swift", "5")

let iOS = (language: "Swift", version: "5")

iOS.0
iOS.1

iOS.language
iOS.version

// 함수 파라미터와 반환하는 파라미터에 튜플을 사용할때 
func 튜플(a: Int, b: (Int, Int)) -> (first: Int, second: Int) {
  return (a + b.0,  a + b.1)
}

let result = 튜플(a: 10, b: (20, 30))
result.first
result.second
result.0
result.1
```

- Comparison Operators

Tuple은 7개 미만 요소에 대한 비교 연산자가 포함되어 있음

7개 이상의 요소를 비교하기 위해서는 비교 연산자를 직접 구현해야 함

``` swift
var something1: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
var something2: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
something1 == something2

//var something3: (Int, Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6,7)
//var something4: (Int, Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6,7)
//something3 == something4

```

- Tuple Matching

``` Swift
let somePoint = (1, 0)

switch somePoint {
case (0, 0):
  print("\(somePoint) is at the origin")
case (_, 0):
  print("\(somePoint) is on the x-axis")
case (0, _):
  print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
  print("\(somePoint) is inside the box")
default:
  print("\(somePoint) is outside of the box")
}
// 순서 유의 
```

---

3. **Loops** 

- For-In Loops
- While Loops 
  - while
  - repeat-while



1)  For-In Loops

``` swift
// 형식
for item in items {
   code
 }

for index in 1...4 {
  print("\(index) times 5 is \(index * 5)")
}

// Wildcard Pattern (index 라는 변수를 써도 되는데 안써도 될때는 _ 로 써줄수있다. 단순히 반복을 위한)
for _ in 0...3 {
  print("hello")
}

// 한줄씩 H e l l o 프린트
for chr in "Hello" {
  print(chr, terminator: " ")
}
print()

// 배열에서 사용 
let list = ["Swift", "Programming", "Language"]
for str in list {
  print(str)
}
```

2) While Loops

조건이 거짓이 될 때까지 일련의 명령문 수행

첫 번째 반복이 시작되기 전에 반복 횟수를 알지 못할 때 많이 사용

while / repeat-while

```swift
// while 문
while condition {
   code
 }
// repeat- while 문 
repeat {
   code
 } while condition
 
//루프를 통과하는 각 패스의 끝 부분에서 조건을 평가
// 다른 언어에서는 do - while 문으로 많이 사용
```

---

4. **Control Transfer Statement (제어 이전)**

특정 코드에서 다른 코드로 제어를 이전하여 코드 실행 순서를 변경하는 것

Swift 에는 5가지 키워드 사용

continue , break, fallthrough, return , throw



1) continue 

현재 반복문의 작업을 중단하고 다음 반복 아이템에 대한 작업 수행

``` swift
for num in 0...15 {
  if num % 2 == 0 {
    continue
  }
  print(num)
}
// 결과값은 ?
```

2) return 

함수를 즉시 종료하고, return type에 해당하는 자료를 반환

```swift
//1)
func isEven(num: Int) -> Bool {
  if num % 2 == 0 {
    return true
  }
  return false
  //return num % 2 == 0
}

isEven(num: 1)  // false
isEven(num: 2)  // true

//2) 
  func returnFunction() -> Int {
  var sum = 0
  
  for _ in 1...100 {
    sum += 20
    return sum
//    return 5
  }
  return 7
}

print(returnFunction())
// 결과값은? 
```

3) break 

break가 포함된 해당 제어문의 흐름을 즉각 중단 (반복문, switch 문)

``` swift
//1)
for i in 1...100 {
  print(i)
  break
}
// 결과값은?

//2) 
for i in 1...100 {
  print(i)
  return
}

// 결과값은? - return 은 함수에서 쓰이는 것이기 때문에 이건 에러가 난다. 

//3) 
for num in 0...8 {
  if num % 2 == 0 {
    break
  }
  print(num)
}
// 결과값은? 아무것도 안찍힌다. 

//4) 중첩 루프 (이중 for 문)
for i in 0...3 {
  for j in 0...3 {
    if i > 1 {
      break
    }
    print("  inner \(j)")
  }
  print("outer \(i)")
}
// 결과는? 각각의 실행 횟수와 순서를 생각해보세요.

```


