# Collection

---

## Contents

- Value Type (Swift Collection)
  - Array
  - Dictionary
  - Set 
- Object Type (Foundation Collection)
  - NSArray, NSMutableArray
  - NSDictionary, NSMutableDictionary
  - NSSet, NSMutableSet
- Generic Collection
- Mutability
  - let => Immutable Collection
  - var => Mutable Collection

---

1) **Array**

-  Ordered Collection ( 순서가 있는 데이터 모음)
- Zero-based Integer Index (인덱스 기본 0 )



- Array Type 

  ``` swift
  var arrayFromLiteral = [1, 2, 3]
  arrayFromLiteral = []
  type(of: arrayFromLiteral)
  
  //let emptyArray = [] (에러가 난다. 타입을 몰라서) 
  //let emptyArray: [String] = [] (빈 값을 지정해주고 싶으면 타입을 지정해줘야 한다.)
  
  
  ```

- Initialize 

  ``` swift
  // Type Annotation
  let strArray1: Array<String> = ["apple", "orange", "melon"]
  let strArray2: [String] = ["apple", "orange", "melon"]
  
  // Type Inference
  let strArray3 = ["apple", "orange", "melon"]
  let strArray4 = Array<String>(repeating: "iOS", count: 5) // (repeating 을 많이 쓴다. iOS 라는 																															값을 5개 만든다.)
  
  // Error
  //let strArray5 = ["apple", 3.14, 1] (서로 다른 타입이면 에러가 난다.) -> Any 타입으로 해주면 할 수있다.
  
  ```

- Number of Elements 

  ``` swift
  // 갯수 확인하기 - count
  let fruits = ["Apple", "Orange", "Banana"]
  let countOfFruits = fruits.count
  countOfFruits
  
  // 비어있는지 확인 - isEmpty
  if !fruits.isEmpty {
    print("\(countOfFruits) element(s)")
  } else {
    print("empty array")
  }
  
  ```

- Retrieve an Element 

   ``` swift
  //              0        1         2          3
  // fruits = ["Apple", "Orange", "Banana", endIndex]
  
  fruits[0]
  fruits[2]
  //fruits[123] - (오류)
  
  fruits.startIndex  
  fruits.endIndex
  type(of: fruits.endIndex)
  
  fruits[fruits.startIndex]
  //fruits[fruits.endIndex] -(오류)
  fruits[fruits.endIndex - 1] 
  
  fruits.startIndex == 0
  fruits.endIndex - 1 == 2
  
  
   ```

- Searching

  ``` swift
  // .contains 사용
  let alphabet = ["A", "B", "C", "D", "E"]
  
  if alphabet.contains("A") {
    print("contains A")
  }
  
  // 추가 작업을 하면서 .contains 사용 
  if alphabet.contains(where: { str -> Bool in
    // code...
    return str == "A"
  }) {
    print("contains A")
  }
  
  // 인덱스 값을 구할때  - 답 :3
  if let index = alphabet.firstIndex(of: "D") {
    print("index of D: \(index)")
  } else {
    print("No index")
  }
  
  ```

- Add a new Element 

  ``` swift
  // A 원소 뒤에 B, C 추가 
  var alphabetArray = ["A"]
  alphabetArray.append("B")
  alphabetArray += ["C"]
  alphabetArray = alphabetArray + ["C"]
  
  // 같은 타입을 가진 배열끼리 더하기 가능 
  var alphabetArray2 = ["Q", "W", "E"]
  alphabetArray + alphabetArray2
  
  //alphabetArray.append(5.0) - 서로 다른 타입들을 더해주면 에러가 난다. 
  //alphabetArray + 1
  
  // 내가 원하는 위치에 값을 넣고 싶을때 
  alphabetArray.insert("S", at: 0)
  alphabetArray.insert("F", at: 3)
  alphabetArray
  
  ```

- Chage an Existing Element 

  ``` swift
  // A 대신 Z 로 바꾼다. 
  alphabetArray = ["A", "B", "C"]
  alphabetArray[0] = "Z"
  alphabetArray
  
  // 범위 연산자 사용하여 
  alphabetArray = ["A", "B", "C", "D", "E", "F"]
  alphabetArray[2...]
  alphabetArray[2...] = ["Q", "W", "E"]
  alphabetArray
  
  
  ```

- Remove an Element 

  ``` swift
  // 지우고 싶을때 
  alphabetArray = ["A", "B", "C", "D", "E"]
  
  let removed = alphabetArray.remove(at: 0)  // removed 변수에는 지워진 값이 들어있다. ="A"
  alphabetArray
  
  // 전체를 다 지울때 
  alphabetArray.removeAll()
  
  
  // index 찾아 지우기
  alphabetArray = ["A", "B", "C", "D", "E"]
  
  if let indexC = alphabetArray.firstIndex(of: "C") {
    alphabetArray.remove(at: indexC)
  }
  alphabetArray
  
  
  ```

- Sorting

  ``` swift
  
  alphabetArray = ["A", "B", "C", "D", "E"]
  alphabetArray.shuffle()   // 섞는것 
  
  alphabetArray.sort()     // 정렬 하는 것
  alphabetArray
  
  //  shuffle vs shuffled - 반환 타입의 차이 suffle - void , shuffled - string, suffle 하면 자기 자신이 그대로 바뀐다. suffled 같은 경우 자기 자신은 그대로고 또 다른 새로운 배열을 만들어서 반환 
  
  // sorted vs sort - 똑같이 sorted 는 새로운 것을 만들어서 반환, sort 는 자기 자신이 그대로 반환.
  
  
  // sort by closure syntax
  
  sortedArray = alphabetArray.sorted { $0 > $1 } // 왼쪽에 더 큰값을 넣겠다. 
  alphabetArray.sorted(by: >= )
  sortedArray
  
  
  ```

- Enumerating an Array 

  ``` swift
  // 배열의 인덱스와 내용을 함께 알고 싶을 때
  
  let array = ["Apple", "Orange", "Melon"]
  
  for value in array {
    if let index = array.firstIndex(of: value) {
      print("\(index) - \(value)")
    }
  }
  
  // enumerated 를 하게 되면 튜플 값을 제공해준다. 
  for tuple in array.enumerated() { 
    print("\(tuple.0) - \(tuple.1)")
  //  print("\(tuple.offset) - \(tuple.element)")
  }
  
  // 이렇게 나눠서 출력을 해주는게 좋다. 
  for (index, element) in array.enumerated() {
    print("\(index) - \(element)")
  }
  
  // 거꾸로 출력하고 싶을때.
  for (index, element) in array.reversed().enumerated() {
    print("\(index) - \(element)")
  }
  
  
  ```

  ---

  2. **Dictionary**

  - Element = Unique Key + Value
  - Unordered Collection



- Dictionary Literal 

  ``` swift
  // 형식 key끼리는 같은 타입 , value끼리는 같은 타입
  var dictFromLiteral = ["key 1": "value 1", "key 2": "value 2"]
  var dictFromLiteral = [1: "value 1", 2: "value 2"]
  var dictFromLiteral = ["1": 1, "2": 2]
  
  ```

- Dictionary Type 

  ```swift
  let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
  let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
  let words3 = ["A": "Apple", "B": "Banana", "C": "City"]
  
  ```

- Number of Elements

  ```swift
  var words = ["A": "Apple", "B": "Banana", "C": "City"]
  let countOfWords = words.count
  
  if !words.isEmpty {
    print("\(countOfWords) element(s)")
  } else {
    print("empty dictionary")
  }
  ```

- Retrieve an Element

  ``` swift
  var words = ["A": "Apple", "B": "Banana", "C": "City"]
  
  words["A"]
  words["Q"] // nil 이 반환된다. 
  
  if let aValue = words["A"] {
    print(aValue)
  } else {
    print("Not found")
  }
  
  // key 와 value 를 따로 구할수 있다. 
  print(words.keys)
  print(words.values)
  
  let keys = Array(words.keys)
  let values = Array(words.values)
  
  print(keys)
  print(values)
  
  
  ```

- Enumerating an Dictionary 

  ``` swift
  let dict = ["A": "Apple", "B": "Banana", "C": "City"]
  
  for (key, value) in dict {
    print("\(key): \(value)")
  }
  
  for (key, _) in dict {
    print("Key :", key)
  }
  
  for (_, value) in dict {
    print("Value :", value)
  }
  
  // 처음부터 value 에 대해서만 출력하겠다. 
  for value in dict.values {
    print("Value :", value)
  }
  ```

- Searching

  ``` swift
  var words = ["A": "Apple", "B": "Banana", "C": "City"]
  
  for (key, _) in words {
    if key == "A" {
      print("contains A key.")
    }
  }
  
  
  // closure 를 이용
  if words.contains(where: { (key, value) -> Bool in
    return key == "A"
    }) {
    print("contains A key.")
  }
  ```

- Add a New Element 

  ```swift
  words = ["A": "A"]
  
  words["A"]    // Key -> Unique
  
  words["A"] = "Apple"
  words
  
  words["B"] = "Banana" // 새로운 값이 추가
  words
  
  words["C"] = "City" // 새로운 값이 추가 
  words
  ```

- Change an Existing Element 

  ``` swift
  words = [:]
  words["A"] = "Application"
  words
  
  words["A"] = "App"
  words
  
  
  // 키가 없으면 데이터 추가 후 nil 반환,
  // 키가 이미 있으면 데이터 업데이트 후 oldValue 반환
  if let oldValue = words.updateValue("Apple", forKey: "A") {
    print("\(oldValue) => \(words["A"]!)")
  } else {
    print("Insert \(words["A"]!)")
  }
  words
  ```

- Remove an Element

  ```swift
  // 삭제하고 싶을때 
  words = ["A": "Apple", "I": "IPhone", "S": "Steve Jobs", "T": "Timothy Cook"]
  words["S"] = nil
  words["Z"] = nil // 오류는 나지 않는데 아무런 변화 없다. 
  words
  
  
  // 지우려는 키가 존재하면 데이터를 지운 후 지운 데이터 반환, 없으면 nil
  if let removedValue = words.removeValue(forKey: "T") {
    print("\(removedValue) removed!")
  } else {
    print("Not Found")
  }
  words
  
  words.removeAll() // 딕셔너리 다 지우는거. 
  ```

- Nested 

  ```swift
  var dict1 = [String: [String]]()
  //dict1["arr"] = "A"  오류 
  
  dict1["arr1"] = ["A", "B", "C"]
  dict1["arr2"] = ["D", "E", "F"]
  dict1
  
  // value 가 딕셔너리
  var dict2 = [String: [String: String]]()
  dict2["user1"] = [
    "name": "나개발",
    "job": "iOS 개발자",
    "hobby": "코딩",
  ]
  dict2["user2"] = [
    "name": "나코딩",
    "job": "Android 개발자",
    "hobby": "코딩",
  ]
  dict2
  
  ```

  ---

  3. **Set**

  - Unordered Collection
  - Unique Value
  - Set Literal = Array Literal
  - 배열 / 딕셔너리에 비해 중요도 ↓

  ``` swift
  // 형식
  let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
  let numbers: Set = [1, 2, 3, 3, 3]
  let emptySet = Set<String>()
  
  ```

  - Searching 

    ```swift
    // 순서가 고정되어있는게 아니다. 
    let x: Set = [1, 2, 3, 4, 5]
    let y: Set = [1, 2, 3, 4, 5]
    x
    y
    
    //fruitsSet[0]    // 순서 X -> Index X
    x.first   // O 첫번째 값에 접근 하려고 할때
    
    // 배열과 똑같이 contains 
    if fruitsSet.contains("Apple") {
      print("Contains Apple")
    }
    
    // hasPrefix(i) - 앞에 i 가 붙는것을 찾아낼때
    let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
    
    for element in productSet {
      if element.hasPrefix("i") {
        print(element)
      }
    }
    
    ```

  - Add a new element

    ``` swift
    //Set 에서는 인덱스 개념이 아니여서 append 가 안된다. insert 만 
    var stringSet: Set<String> = []
    stringSet.insert("Apple")
    stringSet
    
    stringSet.insert("Orange")
    stringSet
    
    stringSet.insert("Orange") // 값이 중복되면 무시, 추가가 되지 않는다. 
    stringSet
    ```

  - Remove an Element 

    ```swift
    // remove 사용
    stringSet = ["Apple", "Orange", "Melon"]
    
    stringSet.remove("Apple")
    stringSet
    
    if let removed = stringSet.remove("Orange") {
      print("\(removed) has been removed!")
    }
    
    stringSet
    
    // 다 지울때
    stringSet.removeAll()
    
    ```

  - Compare two sets

    ``` swift
    //  값의 순서를 따지면서 비교할때 elementsEqual
    var favoriteFruits1 = Set(["Orange", "Melon", "Apple"])
    var favoriteFruits2 = Set(["Apple", "Melon", "Orange"])
    
    favoriteFruits1 == favoriteFruits2
    favoriteFruits1.elementsEqual(favoriteFruits2)
    
    // 포함 관계 여부. 상위/하위 집합.
    // group1 ⊇ group2
    let group1: Set = ["A", "B", "C"]
    let group2: Set = ["A", "B"]
    
    // 자주 쓰지는 않는다. 
    // superset
    group1.isSuperset(of: group2)
    group1.isStrictSuperset(of: group2)
    
    // strictSuperset - 자기 요소 외 추가 요소가 최소 하나 이상 존재해야 함
    group1.isSuperset(of: group1)
    group1.isStrictSuperset(of: group1)
    
    // subset도 같은 방식
    group2.isSubset(of: group1)
    group2.isStrictSubset(of: group1)
    group2.isStrictSubset(of: group2)
    ```

  4. Fundamental Set Operations 

     - intersection - 교집합

     - symmetricDifference - 교집합의 여집합

     - union - 합집합

     - subtracting - 차집합

   ```swift
  favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
  tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
  
  // 교집합에 해당하는 요소를 반환
  let commonSet = favoriteFruits.intersection(tropicalFruits)
  commonSet
  
  // 교집합에 해당하는 요소만 남기고 나머지 제거
  tropicalFruits.formIntersection(favoriteFruits)
  tropicalFruits
  
  // 교집합의 여집합 요소들을 반환
  let exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
  exclusiveSet
  
  // 합집합 반환
  var unionSet = favoriteFruits.union(tropicalFruits)
  unionSet
  
  // 차집합 반환
  let uncommonSet = favoriteFruits.subtracting(tropicalFruits)
  uncommonSet
```
