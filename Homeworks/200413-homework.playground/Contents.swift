import UIKit

//1) 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
//(1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)

func putNumTogether (_ a : Int, _ b : Int ) -> Int {
    var putTogether = String(a) + String(b)
    
    return Int(String(putTogether))!
}

putNumTogether(6, 100)


func putNumTogether2 ( a : Int, b :Int ) -> Int {
    var tempNumber = b
    var numberOfCount = 1
    
    while tempNumber > 0 {
        numberOfCount *= 10
        tempNumber /= 10
    }
    return (a * numberOfCount) + b
    
}

putNumTogether2(a: 6, b: 100)

//2) 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수

func isSame (message1 : String, message2 : String) -> Bool {
    if message1 == message2 {
        return true
    } else {
        return false
    }
}

isSame(message1: "안녕하세요", message2: "어서오세요")


func isSame2 (_ message3 : String, _ message4 : String) {
    guard message3 == message4  else {
        print("두 문자열은 다릅니다.")
        return
        }
     print("두 문자열은 같습니다.")
}

isSame2("안녕하세요", "안녕하세요")
//3)자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

func submultiple ( _ input : Int) {
    for index in 1 ... input {
        if (input % index ) == 0 {
            print(index, terminator: "\n")
        }
    }
}

submultiple(10)
//4)100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

func printAllNum ( a : Int, b : Int ) {
    print("\(a)와 \(b) 의 공배수는 " )
    
    for i in 1...100{
        if (( i % a) == 0) && ((i % b ) == 0) {
            print( i )
        }
        
    }
    
}

printAllNum(a: 3, b: 5)


//[ 도전 과제 ]
//- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수

func existOnlyTwoNums (_ num : Int) {
    var array : [Int] = []
    
    for i in 1...num {
        if num % i == 0 {
            array.append(i)
        }
        
    }
    
    if array.count == 2{
        print(" 숫자 \(num) 은(는) 소수 입니다.")
    } else {
        print(" 숫자 \(num) 은(는) 소수가 아닙니다.")
    }


}

existOnlyTwoNums(14)

// 답안지 풀이 :
func isPrimeNumber(_ number: Int) -> Bool {
  guard number > 1 else { return false }
  guard number != 2 else { return true }
  
  for i in 2..<number {
    if number % i == 0 {
      return false
    }
  }
  return true
}

isPrimeNumber(15)
isPrimeNumber(33)
isPrimeNumber(94)

isPrimeNumber(2)
isPrimeNumber(17)
isPrimeNumber(23)


//- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
//  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
//  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력

func fibonacciNumber(at index: Int) -> Int {
  var op1 = 0, op2 = 1
  
  for i in 0..<index {
    if i % 2 == 0 {
      op1 += op2
    } else {
      op2 += op1
    }
  }
  
  return index % 2 == 0 ? op1 : op2
}

fibonacciNumber(at: 0)
fibonacciNumber(at: 1)
fibonacciNumber(at: 2)
fibonacciNumber(at: 3)
fibonacciNumber(at: 4)
fibonacciNumber(at: 5)
fibonacciNumber(at: 6)




//- 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
//  (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
//  ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
//      윤년X 예시 - 200, 300, 500, 600, 1900, 2100

func isLeapYear(_ year: Int) -> Bool {
    if year.isMultiple(of: 400) {
        return true
    }   else if year.isMultiple(of: 100) {
        return false
    }   else {
        return year.isMultiple(of: 4)
    }
}

isLeapYear(2000)
isLeapYear(2004)

isLeapYear(1000)
isLeapYear(1970)
isLeapYear(2002)
