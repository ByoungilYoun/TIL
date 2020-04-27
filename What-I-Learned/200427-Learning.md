# UIVIewController

---

- The Role of View Controllers 

  앱 구조의 뼈대

  모든 앱에 반드시 하나 이상, 대부분 많은 수의 ViewController 로 구성

  - 주요 역할 
    - View Management
    - Data Marshaling
    - User Interactions
    - Resource Management
    - Adaptivity



- View Management

  주요 역할 - 뷰 계층 관리

  모든 뷰컨트롤러마다 RootView를 지나며, 화면에 표시하기 위해서는 해당 RootView 계층에 속해야 함

  ![1](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/1.png)

- Two types of view controllers

  1) Content View Controllers

  	 - 모든 뷰를 단독으로 관리
  	 - UIViewController, UITableViewController, UICollectionViewController 등

  2) Containter View Controllers

  	-  자체 뷰 + 하나 이상의 자식 뷰 컨트롤러가 가진 루트뷰 관리
  	-  각 컨텐츠를 관리하는 것이 아닌 루트뷰만 관리하며 컨테이너 디자인에 따라 크기 조정
  	-  UINavigationController, UITabbarController, UIPageViewController 등

  ![2](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/2.png)

- Data Marshaling

  MVC(Model-View-Controller)

  자신이 관리하는 View 와 Data 간 중개 역할

  ![3](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/3.png)

- User Interactions

  이벤트 처리

  뷰컨트롤러는 Responder 객체 : 직접 이벤트를 받아 처리 가능하나 일반적으로 지양

  뷰가 그 자신의 터치 이벤트를 연관된 객체에 action 메서드나 delegate 로 전달

- Resource Management

  뷰컨트롤러가 생성한 모든 뷰와 객체들은 뷰컨트롤러의 책임

  뷰컨트롤러의 생명 주기에 따라 생성되었다가 자동 소멸되기도 하지만 ARC 개념에 맞게 관리 필요

  메모리 부족 시 didReceiveMemoryWarning 메서드에서 꼭 유지하지 않아도 되는 자원들은 정리 필요

- Adaptivity

  뷰컨트롤러는 뷰의 표현을 책임지고, 현재 환경에 적절한 방법으로 적용되도록 할 책임을 가짐

  ![4](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/4.png)



# The View Controller Hierarchy

---

- The Root View Controller 

  UIWindow는 그 자체로는 유저에게 보여지는 컨텐츠를 가지지 못함

  Window는 정확히 하나의 Root View Controller 를 가지는데 이것을 통해 컨텐츠를 표현	

  ![5](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/5.png)

- View Controller Life Cycle

  ![6](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/6.png)

- Presented View Controllers

  ![7](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/7.png)

# ViewController Life Cycle

---

- ViewController Life Cycle

  ​	![8](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/8.png)

  ​	![9](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/9.png)

# Card-Style Modal Presentation

---

- 왼쪽이 iOS12 기준, 오른쪽이 iOS 13 기준(위에 있는 화면을 내리면 닫힌다.)

![10](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/10.png)

기존에는 fullscrean, pagesheet, formsheet 이 기본이였다. 

![11](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/11.png)

automatic 이라는 것이 생겼다. 

![12](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/12.png)

- Modal Presentation Style

  ![13](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/13.png)

  ![14](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/14.png)

  ![15](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/15.png)

# Card-Style Lifecycle

---

![16](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/16.png)

![17](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/17.png)

![18](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/18.png)

![19](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/19.png)

![20](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/20.png)

![21](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/21.png)

![22](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/22.png)

![23](https://github.com/ByoungilYoun/TIL/blob/master/Images/200427-Images/23.png)

