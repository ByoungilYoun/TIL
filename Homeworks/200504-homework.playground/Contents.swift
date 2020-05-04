import UIKit

// 과제.
// 1.
//func addTwoValues(a: Int, b: Int) -> Int {
//  return a + b
//}
//let task1: Any = addTwoValues(a: 2, b: 3)
//
//위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
//task1 + task1

func addTwoValues(a : Int, b : Int) -> Int {
    return a + b
    }

let task1 : Any = addTwoValues(a: 2, b: 3)

//var sum = Int(task1) + Int(task1)

if let result = task1 as? Int {

    let sum = result + result

    print(sum)
}




//[ 도전 과제 ]
//1.
//let task2: Any = addTwoValues
//과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
//두 변수의 더하기 연산이 제대로 동작하도록 할 것
//(addTwoValues의 각 파라미터에는 원하는 값 입력)
//
//task2 + task2

func addTwoValues2 (a : Int, b : Int) -> Int {
    return a + b
}

let task2 : Any = addTwoValues(a: 5, b: 5)

if let result = task2 as? Int {
    let sum = result + result
    
    print(sum)
}





//2.
class Car {}

let values: [Any] = [1, 99.9, (2.0, Double.pi), Car(), {(str : String) -> Int in str.count}]

//위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기

for value in values {
    switch value {
    case let num1 as Int :
        print(num1)
    case let num2 as Double :
        print(num2)
    case let num3 as (Double, Double) :
        print(num3)
    case let num4 as Car:
        print(num4)
    case let num5 as ((String)->Int):
        print(num5)
    default :
        break
   }
}

