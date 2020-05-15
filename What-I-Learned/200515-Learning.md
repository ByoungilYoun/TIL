# AutoLayout

---

### 1) AutoLayout

뷰에 주어진 제약 조건에 따라 뷰의 크기와 위치를 동적으로 계산해 배치하는 것

외부 또는 내부의 변화에 동적으로 반응하여 유저 인터페이스 구성 

### 2) External / Internal Changes

- 외적 변화 요소 (External Changes)
  - 서로 다른 기기 및 스크린 크기
  - 기기 회전
  - iPad / iPhone 등에서 Split View 로 진입하거나 빠져나올 때 
- 내적 변화 요소 (Internal Changes)
  - 앱에서 보여지는 컨텐츠의 변화
  - 국제화 지원(텍스트, 날짜와 숫자, RTL 등)
  - Dynamic Type 지원 (글꼴 크기)

### 3) Laying out a user interface 

유저 인터페이스 구성을 위한 3가지 주요 접근 방식

- Frame 기반의 프로그래밍 방식
- Autoresizing masks (Auto Layout 전에 있었다. )
- Auto Layout

### 3-1) Frame-Based Layout

프레임 기반의 프로그래밍 방식

- 원점의 위치와 크기를 통해 그릴 영역 계산
- 가장 유연하며 빠른 성능
- 모든 뷰에 대해 개별적인 설정과 관리
- 동적인 변화에 대한 설계 및 디버그, 유지 관리에 많은 노력 필요

![1](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/1.png).  

### 3-2) Auto Layout 

오토 레이아웃 방식 

- 제약 조건을 이용해 유저 인터페이스 정의 
- 뷰간의 관계 설정을 통한 크기와 위치 계산
- 내/ 외부 변경 사항에 동적으로 반응
- Frame 기반에 비해 느린 성능

![2](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/2.png).  

### 4) Control-Dragging Constraints

![3](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/3.png).  

### 5) Auto Layout Tools 

![4](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/4.png).  

### 6) Align Tool 

![5](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/5.png). 

### 7) Pin Tool 

![6](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/6.png).  

### 8) Resolve Auto Layout Issues Tool 

![7](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/7.png).  

### 9) Auto Layout Attributes

![8](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/8.png).   

### 10) Constraint

![9](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/9.png).  

![10](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/10.png).  

### 11) Anatomy of a Constraint 

![11](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/11.png).  

### 12) Anatomy of a Constraint 

![12](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/12.png).  

### 13) Nonambiguous, Satisfiable Layouts

![13](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/13.png).  

### 14) Layout Guide 

![14](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/14.png).  

### 15) The Safe Area of an Interface 

![15](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/15.png).  

![16](https://github.com/ByoungilYoun/TIL/blob/master/Images/200515-Images/16.png).  


