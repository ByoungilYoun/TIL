# Memory Management

---

## Memory Management without ARC 

1. GC ( Grarbage Collection)
   - 정기적으로 Garbage Collector 가 동작하여 더이상 사용되지 않는 메모리를 반환하는 방식
   - OS X 에서만 지원했었으나 버전 10.8 (Mountain Lion) 부터 deprecated(중요도가 떨어짐)
   - 런타임에 동작하여 언제 메모리가 회수될지 모르기 때문에 불확실성
2. MRR (Manual Retain-Release) / MRC (Manual Referece Counting)
   - RC(Reference Counting) 를 통해 메모리를 수동으로 관리하는 방식
   - retain / release / autorelease 등의 메모리 관리 코드를 직접 호출
   - 개발자가 명시적으로 RC 를 증가시키고 감소시키는 작업 수행
   - 컴파일 타임에 다 할수 있지만 개발자가 신경을 쓸 일이 많다

---

### MRR

- RC 에 대한 이해 필요 (Reference Counting / Retain Count / Reference Count) 
- Objective-C 에서는 ARC 해제 가능

![1](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/1.png)   

---

### Reference Counting

![2](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/2.png).     

---

### Leak vs Dangling Pointer

- 카운트 할당과 해제는 균형이 맞아야 함
  - alloc , retain 이 많을 경우는 Memory Leak 발생 
  - release 가 많을 경우 Dangling Pointer (허상, 고아)발생

![3](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/3.png).  

---

### MemoryManagement Is Hard

![4](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/4.png). 

![5](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/5.png).  

---

### Programming with Retain / Release 

![6](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/6.png).  

---

### Xcode Static Analyzer

![7](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/7.png).  

---

### ARC 

ARC ( Automatic Reference Counting)

- **RC** **자동 관리 방식** **(WWDC 2011** 발표)
- 컴파일러가 개발자를 대신하여 메모리 관리 코드를 적절한 위치에 자동으로 삽입
- GC 처럼 런타임이 아닌 컴파일 단계에서 처리 (Heap 에 대한 스캔 불필요, 앱 일시 정지 현상 없음)
- 메모리 관리 이슈를 줄이고 개발자가 코딩 자체에 집중할 수 있도록 함

![8](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/8.png).  

- ARC 는 클래스의 인스턴스에만 적용 ( Class - Reference 타입, Struct / Enum - Value 타입 )

- 활성화된 참조카운트가 하나라도 있을 경우 메모리에서 해제 되지 않음

- 참조 타입 

  -  강한 참조 (Strong) : 기본값. 참조될 때마다 참조 카운트 1 증가
  - 약한 참조(Weak), 미소유 참조 (Unowned) : 참조 카운트를 증가시키지 않음

- 강한 순환 참조(Strong Reference Cycles) 에 대한 주의 필요

  ![9](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/9.png). 

  ![10](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/10.png).  

  ![11](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/11.png).  

  ![12](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/12.png).  

  ![13](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/13.png).  

  ![14](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/14.png).  

  ![15](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/15.png).  

  ![16](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/16.png).  

  ![17](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/17.png).  

  ![18](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/18.png).  

  ![19](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/19.png).  

  ![20](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/20.png).  

---

### ARC in Struct? 

값 타입에서는 어떻게 적용이 될까?

스택에 바로 x, y 값이 바로 들어간다.  완전히 별개의 공간에 할당 

retain, release 도 필요없다. 이런건 class 참조 타입에 쓰는것. 

![21](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/21.png).  

![22](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/22.png).  

![23](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/23.png).  

![24](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/24.png).  

![25](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/25.png).  

![26](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/26.png).  



---

### Strong Reference Cycle

- 객체에 접근 가능한 모든 연결을 끊었음에도 순환 참조로 인해 활성화된 참조 카운트가 남아 있어 메모리 누수가 발생하는 현상
- 앱의 실행이 느려지거나 오동작 또는 오류를 발생시키는 원인이 됨

![27](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/27.png).  

![28](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/28.png).  

![29](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/29.png).  

![30](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/30.png).  

---

### Weak Reference

![31](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/31.png).  

![32](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/32.png).  

![33](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/33.png).  

![34](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/34.png).  

![35](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/35.png).  

![36](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/36.png).  

![37](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/37.png).  

![38](https://github.com/ByoungilYoun/TIL/blob/master/Images/200511-Images/38.png).  

