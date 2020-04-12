# The Basics 

## The Swift Programming Language   
 
### Contents    

 - Hello, world!   

 - Constants and Variables   

 - Type Annotation & Type Inference   

 - Literals & Types   

 - Type Conversion   

 - Basic Operators   

 - Function   

***   
 
## 1. Hello, world!   
   
- Hello world! 프린트 하기       
      
	print("Hello, world!")      
        

- 주석 (Comment)   


	 //  : 한 줄 주석 , Command + /   

 	 /// : 한 줄 주석 + Quick Help Markup , Command + Option + /   
   	 
	 /* */ : 멀티 라인 주석    


-  주석의 특징

 1. 빠르게 특정 부분의 코드를 비활성화   

 2. 협업 또는 인계 시 이해를 돕기 위해   
  
 3. 자기 자신을 위해   

 4. 문서화    


- 세미콜론(;)      

 각 라인의 마지막에 붙는 세미콜론 옵션   

 스위프트는 안붙여도 자기 자신이 알아서 문장 끝을 알아내서 처리한다.      

 한 라인에 여러 구문(다중 명령) 을 사용하고 싶을 경우는 세미콜론 필수.    
 
	print(1); print(2); print(3);   


## 2. Constants and Variables    

- 상수와 변수   

 상수와 변수는 현재 어떤 데이터에 대한 상태값, 속성 정보 등을 담고 있는 컨테이너   

 상수 (Constants) : 한 번 설정되면 값 변경 불가   

	let count = 10   
   
	count = 20   // 오류   

 변수 (Variables) : 설정한 값을 변경 가능   
   
	var count = 10   
   
	count = 20   

- Naming   

 영어 외에도 유니코드 문자를 포함한 대부분의 문자를 사용해 네이밍 가능   

	let π = 3.14159   

	let 你好 = "你好世界"   

	let 🐶🐮 = "dogcow"   

	let 한글 = "세종대왕"   

	let `let` = 1   // Swift 에서 사용되는 키워드일 경우 backquote(`) 를 이용해 사용 가능   


## 3. Type Annotation & Type Inference   

- Type Annotation   

 변수 선언 시 사용될 자료의 타입을 콜론 (:) 뒤에 명확하게 지정하는 것   

	let year : Int = 2020   
	
	let language : String   
	language = "Swift"   

- Type Inference    

 변수 선언 시 초기화로 사용되는 값의 타입을 통해 변수의 타입을 추론하여 적용하는 것   

	var weight = 63.5   
	type(of : weight)   

	var dogName = "삐삐"   
	type(of : dogName)   


## 4. Literals & Types   

- 리터럴   

 소스코드에서 고정된 값으로 표현되는 문자(데이터) 그 자체       
   
 정수/ 실수/ 문자/ 문자열/ 불리언 리터럴 등      

- Integer Types     


  - 8-bit : Int8 ( -2^7 ~ 2^7 -1) , UInt8 (0 ~ 2^8 -1)    

  - 16-bit : Int16, UInt16   

  - 32-bit : Int32, UInt32   

  - 64-bit : Int64, UInt64     


- Overflow Operators     


	var add : Int8 = Int8.max &+ 1        


- Floating-point Literal       


	var floatingPoint = 1.23   
	floatingPoint = 1.23e4    
	type(of: floatingPoint)    


Double : 최소 소수점 이하 15 자리수 이하의 정밀도     

Float : 최소 소수점 이하 6자리 이하의 정밀도   

부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음   

- Boolean Literal    


	var isBool = true   
	type(of : isBool)   
   

- String Literal      

    

	let str = "Hello, world!"   
	type(of : str)      
   

- Character Literal     

      
	var nonCharacter = "C"   
	type(of : nonCharacter)     
   
 
- Typealias   

문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용   

	typealias Name = String   

	let name : Name = "Tory"   


## 5. Type Conversion   

	let height = Int8(5)   
	let width = 10   
	let area = height * width   
	print(area) ---> 오류   

	let h = Int8(12)   
	let x = 10 * h   
	print (x)   ---> 실행됨   


## 6. Basic Operators   

- Terminology (전문 용어)   
   
  - Unary Operator (단항 연산자) : Prefix(전위 표기법), Postfix(후위 표기법)   

  - Binary Operator (이항 연산자) : +, -, *, /, % , Infix(중위 표기법)   

  - Ternary Operator (삼항 연산자) : 스위프트에서 삼항 연산자는 단 하나   

	a > 0 ? "positive" : "zero or negative"   

- Assignment Operators    


	var value = 0   
	
	value += 10       
	value -= 5   
	value *= 2   
	value /= 2   
	value %= 2     


- Comparison Operators   

  - Equal to operator   

	a == b   

  - Not equal to operator   

	a != b   

  - Greater than or equal to operator   

	a >= b   

  - Less than operator   

	a < b   

  - Less than or equal to operator   

	a <= b   

- Logical Operators   

  - Logical AND Operator   

	true && true   
	true && false   
	false && true   
	false && false   

  - Logical OR Operator   

	true || true   
	true || false   
	false || true   
	false || false   

  - Logical Negation Operator   

	!true   
	!false   

- Range Operators   

  - Closed Range Operator   
   
   
	0...100     

	for index in 1...5 {
	   print("\(index) times 5 is \(index*5)")     
	}     


  - Half-Open Range Operator     


	0..<100   

	let names = ["Anna", "Alex", "Brian", "Jack"]   
	let count = names.count   
	for i in 0..<count {   
	   print("Person \(i + 1) is called \(names[i]")   
	}     

     

  - 순서를 반대로 적용하는 방법   
      

	for index in (1...5) {  
     	    print("\(index) times 5 is \(index * 5")   
	}    
   
     
  - 1) reversed   

     
	for index in (1...5).reversed() {   
    	   print("\(index) times 5 is \(index * 5)")   
	}       
	print()    


  - 2) stride   

    
	for index in stride(from: 5 , through: 1, by : -1) {   
    	   print("\(index) times 5 is \(index * 5)")    
	}        
	print()    



  - reversed 같은 메서드를 쓰지 않고 역순으로 출력되게 하기     


	let range = 1...5     

   	for index in range {     
   	   let num = range.upperBound - index + range.lowerBound     
    	   print("\(num) times 5 is \(num * 5)")     
   	}        



## 7. Function   

- 일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것   

- 유형   

  - Input 과 Output 이 모두 모두 없는 것   

  - Input 이 없고 Output 만 있는 것 (Generator)   

  - Input 이 있고 Output 은 없는 것 (Consumer)   

  - Input 과 Output 이 모두 있는 것 (Function)    



	func functionName (parameterName : Type) -> Returntype {     
    	   statements       
	}          

- Functions without parameters      

   
	func hello1() {    
    	  print("Hello, world!")     
	}       

	hello1()     


	func hello2() -> String {       
    	   return "Hello, world!"      
	}    
   	
	hello2()      


- Functions without return values      
   
   
	func say(number : Int) {      
   	   print(number)     
	}       

	func say(word: String) -> Void {      
   	   print(word)    
	}       

	func say(something : String) -> () {      
   	   print(something)     
	}    
     

- Functions with params and return values     
 

	func addNumbers(a : Int, b : Int) -> Int {     
	    return a + b     
	}	   
      

- Omit Return     
   
 
	func addTwoNumbers(a: Int, b: Int) -> Int {     
    	   a + b // return a + b 와 동일     
	}        


- Function Scope      


	let outside = "outside"    

	func scope() {     
  	   print(outside)    
  	   let inside = "inside"     
  	   print(inside)      
	}         

	print(inside) // 에러      


- Argument Label     
    
   
	func someFunction(first: Int, second : Int) {      
  	    print(first, second)     
	}     
    
	someFunction(first : 1, second : 2)      
        

	// Specifying Argument Labels         
	func multiplyNumber(1hs num1: Int, rhs num2: Int) {      
   	   num1+num2        
	}            
	
	multiplyNumber(1hs : 10, rhs: 10)     


	// Omitting Argument Labels         
	func someFunction ( _ first : Int,  second : Int) {        
    	   print(first, second)      
	}    
        
	someFunction (1, second : 2)      


- Argument Label을 별도로 지정하는 건 어떤 경우인가??      
   

	func use(item : String) {      
	    print(item)       
	}           

	use(item : "Macbook")      


	func speak( to name : String) {      
  	    print(name)          
	}	      
   
	speak(to: "Jimmy")      


- Default Parameter Values      

   
	func functionWithDefault(param: Int = 12) -> Int {      
   	    return param       
	}        

	functionWithDefault(param : 6)  // param is 6      

	functionWithDefault()  //param is 12           
    

- Variadic Parameters      
  
    
	func arithmeticAverage(_ numbers : Double ...) -> Double {      
      	   var total = 0.0      
           for number in numbers {      
   	      total += number       
   	   }            
   	return total / Double(numbers.count)         
	}   

   
- Nested Functions     

  - 외부에는 숨기고 함수 내부에서만 사용할 함수를 중첩하여 사용 가능    
  

	func chooseFunction(plus : Bool, value : Int) -> Int {      
   	   func plusFunction(input : Int) -> Int {       
   	       input + 1       
   	   }       
   	   func minusFunction(input : Int) -> Int {        
               input -1      
           }      

   	if plus {     
     	   return plusFunction(input : value)       
   	 } else {       
     	   return minusFunction(input : value)       
    	 }        
	}      

	var value = 4      

	chooseFunction(plus : true, value : value)        
	chooseFunction(plus : false, value : value)   
  






      
  
  


    

    

 

    
   
   

  

  
 
