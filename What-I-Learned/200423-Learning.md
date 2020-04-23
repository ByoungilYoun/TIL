\# Xcode



\- 통합 개발 환경(IDE, Integrated Development) = Editor + Compiler + Debugger + ...



\- Ex) Visual Studio, Eclipse, Delphi, Net Beans 등



\- macOS 에서만 실행 가능 



\- 공식 지원 언어 : Swift, Objective-C, C, C++, Fotran, Ruby, Python, Java 등



 



\- ![스크린샷 2020-04-23 오후 1.07.46](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.07.46.png)



\- Source Editor![스크린샷 2020-04-23 오후 1.08.29](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.08.29.png)



\- Project Editor



 ![스크린샷 2020-04-23 오후 1.08.53](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.08.53.png)



\- Navigator 



 ![스크린샷 2020-04-23 오후 1.09.24](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.09.24.png)



 



\- Inspector 



 ![스크린샷 2020-04-23 오후 1.10.05](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.10.05.png)



\- Toolbar 



 ![스크린샷 2020-04-23 오후 1.10.24](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.10.24.png)



\- Line Numbers 



 ![스크린샷 2020-04-23 오후 1.11.03](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.11.03.png)



\- Minimap 



 \- 현재 내 위치가 어디 있는지 



 ![스크린샷 2020-04-23 오후 1.11.23](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.11.23.png)



\- Jump Bar 



 ![스크린샷 2020-04-23 오후 1.12.00](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.12.00.png)



\---



\# The App Life Cycle



\- The Structure of an App



 Model - Controller - View : (MVC) 패턴



 ![스크린샷 2020-04-23 오후 1.14.15](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.14.15.png)



\- The Main Run Loop



 ![스크린샷 2020-04-23 오후 1.17.00](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.17.00.png)



\- Common types of events



 ![스크린샷 2020-04-23 오후 1.18.41](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.18.41.png)



\- State changes in an iOS app 



 ![스크린샷 2020-04-23 오후 1.19.14](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.19.14.png)







​		![스크린샷 2020-04-23 오후 1.21.48](/Users/youn/Desktop/스크린샷 2020-04-23 오후 1.21.48.png)



\- Execution States for Apps wi



 ![스크린샷 2020-04-23 오후 1.23.37](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.23.37.png)



\- Launch Time![스크린샷 2020-04-23 오후 1.48.38](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.48.38.png)



\- The Main Function(Swift)![스크린샷 2020-04-23 오후 1.51.42](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.51.42.png)



\- Into the foreground 



 ![스크린샷 2020-04-23 오후 1.55.27](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.55.27.png)



\- Into the background 



 ![스크린샷 2020-04-23 오후 1.57.57](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 1.57.57.png)



\- Handling alert-based interruptions



 ![스크린샷 2020-04-23 오후 2.31.36](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 2.31.36.png)



\- background to the foreground 



 ![스크린샷 2020-04-23 오후 2.34.10](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 2.34.10.png)



\- The Background Transition Cycle 



 ![스크린샷 2020-04-23 오후 2.34.37](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 2.34.37.png)



\- Background Modes for apps



 ![스크린샷 2020-04-23 오후 2.35.10](/Users/youn/Library/Application Support/typora-user-images/스크린샷 2020-04-23 오후 2.35.10.png)



\---



\# [AppDelegate 만 사용할 때]



\1. SceneDelegate.swift 삭제

\2. AppDelegate.swift 파일에서 UISceneSession Lifecycle 부분 삭제

\3. AppDelegate.swift 파일에 var window: UIWindow? 프로퍼티 작성

\4. Info.plist에서 Application Scene Manifest 키 삭제



\---
