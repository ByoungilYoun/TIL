# UserDefaults 

- iOS 에서 데이터를 파일에 저장하기 위해 사용하는 대표적인 클래스 중 하나
- 간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 pList 파일로 저장

```swift
// Memory
var inMemory = 10
inMemory
```

---

- Question : 메모리와 파일로 저장하는 형태의 차이점은 ?

  메모리는 앱이 실행되다 종료되면 메모리가 사라지고 파일로 저장하면 다시 실행해도 파일에 남아있어서 나중에 불러와서 쓸 수 있다. 

---

```swift
// UserDefaults 는 일반적으로 싱글톤 형태로 사용 
let newUserDefaults = UserDefaults()
// 싱클톤 - 인스턴스 한 개만 만들어서 모두가 공유해서 쓰는 방식
let singletonUserDefaults = UserDefaults.standard

UserDefaults.standard.set(10, forKey: "Ten") // set을 이용해서 값을 넣어준다. 
UserDefaults.standard.integer(forKey: "Ten") // 값을 다시 가져올때 10은 integer 타입이고 키를 넣어준다.

UserDefaults.standard.set(Double.pi, forKey: "Double Pi")
UserDefaults.standard.double(forKey: "Double Pi") // 값을 가져올때 키값을 넣어준다. 

UserDefaults.standard.set(true, forKey: "True")
UserDefaults.standard.bool(forKey: "True")

// 타입이 많아서 다른 타입일 때는 object 를 넣어준다. (object 는 any 타입)
let date = Date()
UserDefaults.standard.set(date, forKey: "Date")
UserDefaults.standard.object(forKey: "Date")
// object로 가져올 때는 Any 타입이므로 타입 캐스팅 필요

//Q. 저장하지 않은 키를 불러올 때 결과는?
UserDefaults.standard.integer(forKey: "WrongKey") // integer는 0 이 기본값이라 없으면 0 이 나온다.
UserDefaults.standard.bool(forKey: "WrongKey")    // bool 은 기본값이 false라 false 가 나온다.
UserDefaults.standard.object(forKey: "WrongKey")  // object는 nil 이 나온다. 


// 뭐가 저장되어있는지 알고 싶을 때 
let userDefaults = UserDefaults.standard
print(userDefaults)

print("\n---------- [ dictionaryRepresentation ] ----------\n")
print(userDefaults.dictionaryRepresentation())

print("\n---------- [ keys ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().keys))

print("\n---------- [ values ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().values))


```

