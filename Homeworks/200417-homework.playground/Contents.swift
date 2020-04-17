//
//[ 도전 과제 ]
//1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
//
//// 오름차순 여부
//let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}

// 방법1
let someClosure1 : (String,String) -> Bool = { s1,s2 in
    return s1 > s2
}

someClosure1("안녕하세요","하이")
someClosure1("나","가")

// 방법2
let someClosure2 : (String,String) -> Bool = {
    $0 > $1
}

someClosure2("하","가")

//// 배열 요소의 개수를 반환
//let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
//  var count: Int = 0
//  for _ in values {
//    count += 1
//  }
//  return count
//}

// 방법1
let countArrayElements1 : ([Int]) -> Int = { array1 in
    return array1.count
    
}

countArrayElements1([1,2,3,4])
countArrayElements1([1,2,3,4,5,6,1])


// 방법2
let countArrayElements2 : ([Int]) -> Int = {
    $0.count
}

countArrayElements2([1,1,1,1,1,1,1,1,1])

