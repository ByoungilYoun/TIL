import UIKit


//[ 과제 ]
//1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
//
//func combineString(str1: String?, str2: String?, str3: String?) -> String {
//  // code
//}
//
//// 입력 예시 및 결과
//combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
//combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"
//
//func combineString(str1 : String? , str2 : String?, str3 : String?) -> String {
//


func combineString(str1: String?, str2: String?, str3: String?) -> String {
    
    var putTogether = " "
    
    if str1 != nil {
        putTogether += str1!
    }
    if str2 != nil {
        putTogether += str2!
    }
    if str3 != nil {
        putTogether += str3!
    }
    
    return putTogether
}
combineString(str1: nil, str2: "ABC", str3: "DEF")
combineString(str1: "ABC", str2: nil, str3: "KFC")
combineString(str1: nil, str2: nil, str3: "ABC")

// 다른 풀이
// Optional Binding을 이용한 방식
func combineString1(str1: String?, str2: String?, str3: String?) -> String {
  var combinedString = ""
  if let unwrappedString = str1 {
    combinedString += unwrappedString
  }
  if let unwrappedString = str2 {
    combinedString += unwrappedString
  }
  if let unwrappedString = str3 {
    combinedString += unwrappedString
  }
  return combinedString
}

// Nil-coalescing Operator 를 이용한 방식
func combineString2(str1: String?, str2: String?, str3: String?) -> String {
  let string1 = str1 ?? ""
  let string2 = str2 ?? ""
  let string3 = str3 ?? ""
  return string1 + string2 + string3
}

combineString1(str1: "AB", str2: "CD", str3: "EF")
combineString1(str1: "AB", str2: nil, str3: "EF")
combineString2(str1: "AB", str2: "CD", str3: "EF")
combineString2(str1: "AB", str2: nil, str3: "EF")





//2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
//enum Arithmetic {
//  case addition, subtraction, multiplication, division
//}

enum Arithmetic  {
    case addition
    case subtraction
    case multiplication
    case division
}


func calculateNums (input : (Int, Int, Arithmetic)) -> Int {
      var result = 0
      
      switch input {
      case let(a, b, Arithmetic) where Arithmetic == .addition :
        result = a + b
      case let(a, b, Arithmetic) where Arithmetic == .subtraction :
        result = a - b
      case let(a, b, Arithmetic) where Arithmetic == .multiplication :
        result = a * b
      case let (a, b, Arithmetic) where Arithmetic == .multiplication :
        result = a / b
      default :
        return 0
    }
      return result
    
}
  

calculateNums(input: (100,10,.multiplication))

//다른 풀이
//enum Arithmetic {
//  case addition, subtraction, multiplication, division
//}
//
//func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
//  switch op {
//  case .addition:
//    return operand1 + operand2
//  case .subtraction:
//    return operand1 - operand2
//  case .multiplication:
//    return operand1 * operand2
//  case .division:
//    return Int(operand1 / operand2)
//  }
//}
//
//print(calculator(operand1: 15, operand2: 25, op: .addition))
//print(calculator(operand1: 30, operand2: 10, op: .subtraction))
//print(calculator(operand1: 12, operand2: 10, op: .multiplication))
//print(calculator(operand1: 24, operand2: 6, op: .division))






//[ 도전 과제 ]
//1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
//각 케이스에는 Double 타입의 Associated Value 를 받도록 함
//
//추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
//섭씨 = (화씨 - 32) * 5 / 9    = celcius = (fahrenheit -32) * 5/9
//섭씨 = 켈빈 + 273             = celcius = kelvin + 273
//
//enum Temperature {
//  // 코드
//}

enum Temperature {
    case celcius(Double)
    case fahrenheit(Double)
    case kelvin(Double)
    
    func toCelcius( x : Double) -> Double {
        
        
        switch self {
        case .celcius(let x) :
            return x
        case .fahrenheit(let x) :
            return ((x - 32) * 5/9)
        case .kelvin(let x) :
            return (x + 273)
        }
    }
}

let getAtemperature = Temperature.fahrenheit(37.5)
getAtemperature.toCelcius(x: 37.5)


// 다른 풀이
//enum Temperature {
//  case celcius(Double)
//  case fahrenheit(Double)
//  case kelvin(Double)
//
//  func toCelcius() -> Double {
//    switch self {
//    case .celcius(let value):
//        return value
//    case .fahrenheit(let value):
//        return (value - 32) * 5 / 9
//    case .kelvin(let value):
//        return value + 273
//    }
//  }
//}
//
//var temperature: Temperature = .celcius(30)
//temperature.toCelcius()
//
//temperature = .fahrenheit(86)
//temperature.toCelcius()
//
//temperature = .kelvin(-273)
//temperature.toCelcius()

