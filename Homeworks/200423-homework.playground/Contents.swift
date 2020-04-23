import UIKit

//[ 과제 - 알고리즘 ]
//1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
//e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2

func addAllNum (_ num : Int) -> Int {
    var sum : Int = 0
    
    if num > 0 {
        for i in 1...num {
            sum += i
        }
    }
    
    if num == 0 {
        sum = 1
    }
    
    if num < 0 {
        for i in num...1{
            sum += i
        }
    }
    
    return sum
}

addAllNum(5)
addAllNum(0)
addAllNum(-2)

//2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
//e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...

func find369 (_ numArray : [String]) -> [String] {
    var newArray : [String] = []
    for i in numArray {
        if i.contains("3") || i.contains("6") || i.contains("9") {
            newArray.append("*")
        } else {
            newArray.append(i)
        }
    }
    return newArray
}

find369(["1","2","3","4","5","6","7","8","9"])






//3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
//e.g.  Input : 6, 9   ->  Output : 18, 3

// 최대공약수ß
// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

// 최소 공배수
// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수


func printMaxAndMin (_ num1: Int, _ num2 : Int) -> (Int,Int) {
    var multipleTwoNum = 0
    
    var bigNum : Int = num1 > num2 ? num1 : num2
    var smallNum : Int = num1 < num2 ? num1 : num2
    

    while !(bigNum % smallNum == 0) {
        let temp = bigNum % smallNum
        bigNum = smallNum
        smallNum = temp
    }

    multipleTwoNum = num1 * num2
    return (multipleTwoNum / smallNum, smallNum)
}

printMaxAndMin(6, 9)


    

