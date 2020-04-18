//import UIKit
//
//[ 과제 ]
//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//  ex) 123 -> 321 , 10293 -> 39201

func changeOver (_ num : Int) -> Int {
    var reverseInt : Int = num
    var reverseArray : [Int] = []
    
    while reverseInt > 0 {
        reverseArray.append(reverseInt % 10)
        reverseInt = reverseInt / 10
    }
    
    reverseArray = reverseArray.reversed()
    
    var tenMultiple : Int = 1
    reverseInt = 0
    for index in reverseArray {
        reverseInt += (index * tenMultiple)
        tenMultiple *= 10
    }
    
    return reverseInt
    
}

changeOver(123)


// 답 :
func reverseDigit(num: Int) -> Int {
  var reversedNumber = 0
  var num = num
  
  while num > 0 {
    reversedNumber = reversedNumber * 10 + num % 10
    num /= 10
  }
  
  return reversedNumber
}


print(reverseDigit(num: 123))
print(reverseDigit(num: 10293))
print(reverseDigit(num: 824))



//- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
//  ex) true - 123, 310, 369   /  false - 100, 222, 770

func isSame (_ input : Int) -> Bool {
    
    var getNumber = input
    var getNumberArray : [Int] = []
    
    while getNumber > 0 {
        getNumberArray.append(getNumber % 10)
        getNumber = getNumber / 10
    }
    
    getNumberArray = getNumberArray.sorted()

    for i in 0..<getNumberArray.count {
        for j in  i+1..<getNumberArray.count {
            if getNumberArray[i] == getNumberArray[j] {
                return false
            }
        }
    }
    return true
}

isSame(12345)

//답 :
func isAllDigitDiff(num: Int) -> Bool {
  guard 100...900 ~= num else {
    print("100 ~ 900 사이의 숫자만 입력하세요")
    return false
  }
  let numStr = String(num)
  let uniqueValues = Set(numStr)
  return uniqueValues.count == numStr.count
}

print(isAllDigitDiff(num: 123))
print(isAllDigitDiff(num: 369))
print(isAllDigitDiff(num: 222))
print(isAllDigitDiff(num: 770))





//[ 도전 과제 ]
//- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//  ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
// 아직 해결 안됨

func printUniqueValues(from arr: [String]) -> [String] {
  var recordArr: [String] = []
  var result: [String] = []
  
  for str in strArr {
    if !result.contains(str) && !recordArr.contains(str) {
      result.append(str)
    } else if let index = result.firstIndex(of: str) {
      result.remove(at: index)
      recordArr.append(str)
    }
  }
  return result
}

let strArr = ["a", "b", "c", "a", "e", "d", "c"]
print(printUniqueValues(from: strArr))




//- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//  + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기



let dict = ["식육목": ["개과": ["개": ["자칼","늑대","북미산 이리",], "여우": ["아메리카 여우",
        "유럽 여우",]],"고양이과": ["고양이": ["고양이","살쾡이"],"표범": ["사자","호랑이"]]]]

if let 식육목 = dict["식육목"],
  let 고양이과 = 식육목["고양이과"],
  let 표범속 = 고양이과["표범"] {
  for 종 in 표범속 {
    print(종)
  }
}

"
