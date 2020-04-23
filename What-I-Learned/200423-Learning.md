# Xcode 

---

- 통합 개발 환경(IDE, Integrated Development) = Editor + Compiler + Debugger + ...
- Ex) Visual Studio, Eclipse, Delphi, Net Beans 등
- -macOS 에서만 실행 가능 
- 공식 지원 언어 : Swift, Objective-C, C, C++, Fotran, Ruby, Python, Java 등

![sss](https://github.com/ByoungilYoun/TIL/blob/master/Images/1.png)



# The App Life Cycle 

---

- The Structure of an App 

  ![2](https://github.com/ByoungilYoun/TIL/blob/master/Images/2.png)

  

- The Main Run Loop

  ![3](https://github.com/ByoungilYoun/TIL/blob/master/Images/3.png)

- Common Types of Events

  ![4](https://github.com/ByoungilYoun/TIL/blob/master/Images/4.png)

  

- State changes in an iOS app

  ![5](https://github.com/ByoungilYoun/TIL/blob/master/Images/5.png)

  ![6](https://github.com/ByoungilYoun/TIL/blob/master/Images/6.png)

- Execution States for Apps 

  ![7](https://github.com/ByoungilYoun/TIL/blob/master/Images/7.png)

- Launch Time 

  ![8](https://github.com/ByoungilYoun/TIL/blob/master/Images/8.png)

- The Main Function(Swift)

  ![9](https://github.com/ByoungilYoun/TIL/blob/master/Images/9.png)

- Into the foreground 

  ![10](https://github.com/ByoungilYoun/TIL/blob/master/Images/10.png)

- Into the background

  ![11](https://github.com/ByoungilYoun/TIL/blob/master/Images/11.png)

- Handling alert-based interruptions

  ![12](https://github.com/ByoungilYoun/TIL/blob/master/Images/12.png)

- Background to the foreground

  ![13](https://github.com/ByoungilYoun/TIL/blob/master/Images/13.png)

- The Background Transition Cycle

  ![14](https://github.com/ByoungilYoun/TIL/blob/master/Images/14.png)

- Background Modes for apps

  ![15](https://github.com/ByoungilYoun/TIL/blob/master/Images/15.png)




# [AppDelegate 만 사용할 때]



1. SceneDelegate.swift 삭제

2. AppDelegate.swift 파일에서 UISceneSession Lifecycle 부분 삭제

3. AppDelegate.swift 파일에 var window: UIWindow? 프로퍼티 작성

4. Info.plist에서 Application Scene Manifest 키 삭제


