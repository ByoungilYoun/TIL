//
//  LogInPageViewController.swift
//  FastCampusLoginPractice2
//
//  Created by 윤병일 on 2020/05/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit


struct Key {
  static var welcome = "Welcome."
  static var userPw = "userPW"
  static var isLogin = "isLogin"
}

class LogInPageViewController: UIViewController, UITextFieldDelegate {
  
  private var titleImage = UIImageView()
  private let square1 = UIView()
  private let square2 = UIView()
  private let square3 = UIView()
  private var userImage = UIImageView()
  private var userTextField = UITextField()
  private var passwordImage = UIImageView()
  private var passwordTextField = UITextField()
  private var signInButton = UIButton(type: .system)
  private var signUpButton = UIButton(type: .system)
  
  let containerView2 = UIView()
  let containerView3 = UIView()
  
  let loginCheck = UserDefaults.standard
  
  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setTitleImageView()
    setThreeSquares()
    setIdImageAndTextField()
    setPasswordAndTextField()
    setSignInButton()
    setSingUpButton()
    
    userTextField.delegate = self
    passwordTextField.delegate = self
  }
  
  //MARK: - ViewDidAppear
  override func viewDidAppear(_ animated: Bool) {
    if UserDefaults.standard.bool(forKey: Key.isLogin) {
      
    } else {
      let mainVC = MainViewController()
      mainVC.modalPresentationStyle = .fullScreen
      present(mainVC, animated: true)
    }
  }
  
  
  // MARK: - 패스트캠퍼스 타이틀 로고
  func setTitleImageView() {
    
    titleImage.frame = CGRect(x: 40, y: 80, width: view.frame.width - 80, height: 50)
    titleImage.image = UIImage(named: "fastcampus_logo.jpg")
    view.addSubview(titleImage)
  }
  
  // MARK: - 네모 3개
  func setThreeSquares () {
    
    let containerView1 = UIView()
    containerView1.frame = CGRect(x: 120, y: 150, width: view.frame.width - 240, height: 40)
    view.addSubview(containerView1)
    
    square1.frame = CGRect(x: 0, y: 0 , width: 30, height: 30)
    square1.layer.cornerRadius = 8
    square1.backgroundColor = .systemRed
    containerView1.addSubview(square1)
    
    square2.frame = CGRect(x: square1.frame.maxX + 20, y: 0, width: 30, height: 30)
    square2.layer.cornerRadius = 8
    square2.backgroundColor = .systemRed
    containerView1.addSubview(square2)
    
    square3.frame = CGRect(x: square2.frame.maxX + 20, y: 0, width: 30, height: 30)
    square3.layer.cornerRadius = 8
    square3.backgroundColor = .systemRed
    containerView1.addSubview(square3)
  }
  //MARK: - 유저 아이디 입력란
  func setIdImageAndTextField() {
    
    
    containerView2.frame = CGRect(x: 30, y: 500, width: view.frame.width - 60, height: 40)
    view.addSubview(containerView2)
    
    userImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    userImage.image = UIImage(named: "user.jpg")
    containerView2.addSubview(userImage)
    
    userTextField.frame = CGRect(x: userImage.frame.maxX + 10, y: 0, width: 250, height: 30)
    userTextField.placeholder = "아이디를 입력하세요"
    userTextField.textAlignment = .left
    userTextField.returnKeyType = .continue
    containerView2.addSubview(userTextField)
    
  }
  //MARK: - 텍스트필드 밑줄
    override func viewDidLayoutSubviews() {
    userTextField.borderStyle = .none
    passwordTextField.borderStyle = .none
    
    let border1 = CALayer()
    border1.frame = CGRect(x: 0, y: userTextField.frame.size.height - 1, width: userTextField.frame.width, height: 1)
    border1.backgroundColor = UIColor.black.cgColor
    userTextField.layer.addSublayer((border1))
    
    let border2 = CALayer()
    border2.frame = CGRect(x: 0, y: passwordTextField.frame.size.height - 1, width: passwordTextField.frame.width, height: 1)
    border2.backgroundColor = UIColor.black.cgColor
    passwordTextField.layer.addSublayer((border2))
    
  }
  
  
  
  //MARK: - 비밀번호 입력란
  func setPasswordAndTextField() {
    
    
    containerView3.frame = CGRect(x: 30, y: 550 , width: view.frame.width - 60, height: 40)
    view.addSubview(containerView3)
    
    passwordImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    passwordImage.image = UIImage(named: "password.jpg")
    containerView3.addSubview(passwordImage)
    
    passwordTextField.frame = CGRect(x: passwordImage.frame.maxX + 10, y: 0, width: 250, height: 30)
    passwordTextField.placeholder = "비밀번호를 입력하세요"
    passwordTextField.textAlignment = .left
    passwordTextField.isSecureTextEntry = true
    passwordTextField.returnKeyType = .join
    containerView3.addSubview(passwordTextField)
    
  }
  
  //MARK: - SignIn 버튼 세팅
  func setSignInButton () {
    signInButton.frame = CGRect(x: 30, y: 600, width: view.frame.width - 60, height: 40)
    signInButton.setTitle("Sign In", for: .normal)
    signInButton.setTitleColor(.white, for: .normal)
    signInButton.backgroundColor = .darkGray
    signInButton.addTarget(self, action: #selector(clickSignInButton), for: .touchUpInside)
    view.addSubview(signInButton)
  }
  
  //MARK: - Sign up 버튼 세팅
  func setSingUpButton () {
    signUpButton.setTitle("Sign Up", for: .normal)
    signUpButton.frame = CGRect(x: 30, y: 650, width: view.frame.width - 60, height: 40)
    signUpButton.setTitleColor(.white, for: .normal)
    signUpButton.backgroundColor = .darkGray
    signUpButton.addTarget(self, action: #selector(clickSignUpButton), for: .touchUpInside)
    view.addSubview(signUpButton)
  }
  
  //MARK: - Sign In 버튼 액션
  @objc func clickSignInButton() {
    if let loginCheck = loginCheck.object(forKey: userTextField.text!) as? String {
      if loginCheck == passwordTextField.text {
      let mainVC = MainViewController()
      mainVC.modalPresentationStyle = .fullScreen
      
      UserDefaults.standard.set("윤병일님 환영합니다!", forKey: Key.welcome)
      UserDefaults.standard.set(passwordTextField.text, forKey: Key.userPw)
      UserDefaults.standard.set(false, forKey: Key.isLogin)
      present(mainVC, animated: true)
      }
    } else {
      UIView.animate(withDuration: 0.5){
        self.userTextField.backgroundColor = .red
        self.userTextField.backgroundColor = .white
        self.passwordTextField.backgroundColor = .red
        self.passwordTextField.backgroundColor = .white
      }
      let alert = UIAlertController(title: "로그인 실패", message: "아이디 또는 비밀번호가 다릅니다.", preferredStyle: .alert)
      let ok = UIAlertAction(title: "확인", style: .default)
      let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
        self.userTextField.text = ""
        self.passwordTextField.text = ""
      }
      alert.addAction(ok)
      alert.addAction(cancel)
      
      present(alert, animated: true)
    }
    
  }
  
  //MARK: - Sign Up 버튼 액션
  @objc func clickSignUpButton() {
    let signupView = SignUpViewController()
    signupView.modalPresentationStyle = .fullScreen
    
    present(signupView, animated: true)
  }
  //MARK: - 키보드 올라올때
  func textFieldDidBeginEditing(_ textField: UITextField) {
    UIView.animate(withDuration: 0.5) {
      self.containerView2.frame = CGRect(x: 30, y: 500 - 150, width: self.view.frame.width - 60, height: 40)
      self.containerView3.frame = CGRect(x: 30, y: 550 - 150 , width: self.view.frame.width - 60, height: 40)
    }
  }
  
  //MARK: - 키보드 내려갈때
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    UIView.animate(withDuration: 0.5){
      self.containerView2.frame = CGRect(x: 30, y: 500, width: self.view.frame.width - 60, height: 40)
      self.containerView3.frame = CGRect(x: 30, y: 550, width: self.view.frame.width - 60, height: 40)
      
    }
    return true
  }
  
  //MARK: - 글자수 제한
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    guard let text = textField.text else {
      return true
    }
    if text.count + string.count > 10 {
      return false
    } else {
      return true
    }
  }
 
  
  
}

