//1. 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func introduceMyself (name : String, age : Int) {
    print("저의 이름은 \(name) 이고 나이는 \(age)살 입니다.")
}

introduceMyself(name: "윤병일", age: 26)

//2. 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수

func isThis2multiply (num : Int) -> String {
    if num % 2 == 0 {
        return "숫자 \(num)은 2의 배수입니다."
    } else {
        return "숫자 \(num)은 2의 배수가 아닙니다."
    }
}

var result = isThis2multiply(num: 10)
print(result)

//3. 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)

func multiply (a : Int , b : Int = 10) -> Int{
    let num = a * b
    return num
}

var result1 = multiply(a: 10)
print(result1)

//4. 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수

func printAverage (scores : Int ...) -> Int {
    var total = 0
    for subject in scores {
        total += subject
    }
    return total / (scores.count)
}

var result2 = printAverage(scores: 100,80,70,90)
print(result2)

//5. 점수를 입력받아 학점을 변환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

func changeScoretoGrade (score : Int) -> String  {
    if score >= 90 {
       return "A"
    } else if score >= 80 {
        return "B"
    } else if score >= 70 {
        return "C"
    } else {
        return "F"
    }
}

var result4 = changeScoretoGrade(score: 85)
print(result4)

// 6. 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 변환하는 함수 (90점 이상 A, 80점 이상 B, 70 점 이상 C, 그 이하 F)

func changeScorestoGrades (scores : Int ... ) -> String {
    var total = 0
    for i in scores {
        total += i
    }
    var totalScore = total / (scores.count)
    
    if totalScore >= 90 {
        return "A"
    } else if totalScore >= 80 {
        return "B"
    } else if totalScore >= 70 {
        return "C"
    } else {
        return "F"
    }
}

var result5 = changeScorestoGrades(scores: 100,50,70,80)
print(result5)

