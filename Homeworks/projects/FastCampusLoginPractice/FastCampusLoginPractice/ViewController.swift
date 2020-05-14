//
//  ViewController.swift
//  FastCampusLoginPractice
//
//  Created by 윤병일 on 2020/05/14.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

struct Key {
  static var userId = "UserID"
  static var userPw = "UserPW"
  static var isLogin = "isLogin"
}

class ViewController: UIViewController , UITextFieldDelegate {
  
  private var titleImage = UIImageView()
  var image : UIImage?
  let squareView1 = UIView()
  let squareView2 = UIView()
  let squareView3 = UIView()
  private var emailImage = UIImageView()
  private var emailTextField = UITextField()
  private var passwordImage = UIImageView()
  private var passwordTextField = UITextField()
  private var signInButton = UIButton(type: .system)
  
  let containerView2 = UIView()
  let containerView3 = UIView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setTitleImage()
    setThreeSquares()
    setEmailImageAndEmail()
    setPasswordImageAndPassword()
    setSignInButton()
    
    
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    //        print(UserDefaults.standard.bool(forKey: Key.isLogin))
    if UserDefaults.standard.bool(forKey: Key.isLogin) {
      
    } else {
      let secondVC = SecondViewController()
      secondVC.modalPresentationStyle = .fullScreen
      present(secondVC, animated: true)
    }
    
  }
  // FastCampus 이미지 뷰 세팅
  func setTitleImage() {
    titleImage.frame = CGRect(x: 40, y: 80, width: view.frame.width - 80, height: 50)
    titleImage.image = UIImage(named: "fastcampus_logo.jpg")
    view.addSubview(titleImage)
  }
  // 작은 네모 3개 세팅
  func setThreeSquares() {
    let containerView = UIView()
    containerView.frame = CGRect(x: 120, y: 150, width: view.frame.width - 240, height: 30)
    view.addSubview(containerView)
    
    squareView1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    squareView1.backgroundColor = .systemRed
    squareView1.alpha = 0.8
    squareView1.layer.cornerRadius = 5
    containerView.addSubview(squareView1)
    
    squareView2.frame = CGRect(x: squareView1.frame.maxX + 20, y: 0, width: 30, height: 30)
    squareView2.backgroundColor = .systemRed
    squareView2.alpha = 0.8
    squareView2.layer.cornerRadius = 5
    containerView.addSubview(squareView2)
    
    squareView3.frame = CGRect(x: squareView2.frame.maxX + 20, y: 0, width: 30, height: 30)
    squareView3.backgroundColor = .systemRed
    squareView3.alpha = 0.8
    squareView3.layer.cornerRadius = 5
    containerView.addSubview(squareView3)
    
  }
  
  // 이메일 이미지 및 이메일 텍스트필드 세팅
  func setEmailImageAndEmail () {
    emailTextField.delegate = self
    
    
    containerView2.frame = CGRect(x: 20, y: 500, width: view.frame.width - 40, height: 40)
    view.addSubview(containerView2)
    
    emailImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    emailImage.image = UIImage(named: "email.jpg")
    containerView2.addSubview(emailImage)
    
    emailTextField.frame = CGRect(x: emailImage.frame.maxX + 20, y: 0, width: 250, height: 30)
    emailTextField.placeholder = "이메일을 입력하세요"
    emailTextField.textAlignment = .left
    emailTextField.keyboardType = .emailAddress
    emailTextField.returnKeyType = .continue
    containerView2.addSubview(emailTextField)
  }
  
  // 패스워드 이미지 및 패스워드 텍스트 필드 세팅
  func setPasswordImageAndPassword() {
    passwordTextField.delegate = self
    
    
    containerView3.frame = CGRect(x: 20, y: 550, width: view.frame.width - 40, height: 40)
    view.addSubview(containerView3)
    
    passwordImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    passwordImage.image = UIImage(named: "password.jpg")
    containerView3.addSubview(passwordImage)
    
    passwordTextField.frame = CGRect(x: passwordImage.frame.width + 20, y: 0, width: 250, height: 30)
    passwordTextField.placeholder = "비밀번호를 입력하세요"
    passwordTextField.textAlignment = .left
    passwordTextField.isSecureTextEntry = true
    passwordTextField.returnKeyType = .join
    containerView3.addSubview(passwordTextField)
    
  }
  
  // SignIn 버튼 세팅
  func setSignInButton () {
    signInButton.setTitle("Sign In", for: .normal)
    signInButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
    signInButton.frame = CGRect(x: 20, y: 600, width: view.frame.width - 40, height: 40)
    signInButton.backgroundColor = .gray
    signInButton.setTitleColor(.white, for: .normal)
    signInButton.addTarget(self, action: #selector(clickSignInButton), for: .touchUpInside)
    view.addSubview(signInButton)
  }
  
  // Sign In 버튼 누루기
  @objc func clickSignInButton () {
    if let emailText = emailTextField.text, let passwordText = passwordTextField.text {
      if emailText == "jimmy7525@naver.com", passwordText == "bi1562014*" {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.resultEmail = emailText
        
        UserDefaults.standard.set(emailText, forKey: Key.userId)
        UserDefaults.standard.set(passwordText, forKey: Key.userPw)
        UserDefaults.standard.set(false, forKey: Key.isLogin)
        
        
        present(secondVC, animated: true)
      } else {
        
        UIView.animate(withDuration: 0.5) {
          self.emailTextField.backgroundColor = .red
          self.emailTextField.backgroundColor = .white
          self.passwordTextField.backgroundColor = .red
          self.passwordTextField.backgroundColor = .white
          
          let alert = UIAlertController(title: "로그인 실패", message: "아이디 또는 비밀번호가 다릅니다", preferredStyle: .alert)
          
          let ok = UIAlertAction(title: "확인", style: .default)
          let cancel = UIAlertAction(title: "취소", style: .cancel)
          
          alert.addAction(ok)
          alert.addAction(cancel)
          
          self.present(alert, animated: true)
        }
        
      }
      
    }
  }
  
  
  // 키보드 올라오기
  func textFieldDidBeginEditing(_ textField: UITextField) {
    UIView.animate(withDuration: 0.5) {
      self.containerView2.frame = CGRect(x: 20, y: 500 - 150, width: self.view.frame.width - 40, height: 40)
      self.containerView3.frame =  CGRect(x: 20, y: 550 - 150, width: self.view.frame.width - 40, height: 40)
      
    }
  }
  
  
  // 키보드 내려가기
  func textFieldShouldReturn(_ textField: UITextField) -> Bool{
    textField.resignFirstResponder()
    
    UIView.animate(withDuration: 0.5) {
      self.containerView2.frame = CGRect(x: 20, y: 500 , width: self.view.frame.width - 40, height: 40)
      self.containerView3.frame =  CGRect(x: 20, y: 550 , width: self.view.frame.width - 40, height: 40)
    }
    return true
    
  }
  
  // 키보드 글자수 제한
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    guard let text = textField.text else {return true}
    
    //        print("text.count = \(text.count) // string.cout = \(string.count)")
    if text.count + string.count > 21 {
      return false
    } else {
      return true
    }
    
  }
}

