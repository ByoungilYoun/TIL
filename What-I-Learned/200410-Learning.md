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

 주석의 특징

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

	let `let` = 1   // Swift 에서 사용되는 키워드일 경우 backquote(`) 를 이용해 	    사용 가능
     

