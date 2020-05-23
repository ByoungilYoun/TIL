//
//  SignUpViewController.swift
//  FastCampusLoginPractice2
//
//  Created by 윤병일 on 2020/05/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController , UITextFieldDelegate{
  
  private var imageTitle = UIImageView()
  private var signUpLabel = UILabel()
  private var idLabel = UILabel()
  private var idTextField = UITextField()
  private var pwLabel = UILabel()
  private var pwTextField = UITextField()
  private var signInButton = UIButton(type: .system)
  private var backButton = UIButton(type: .system)
  private var confirmLabel = UILabel()
  private var confirmTextField = UITextField()
  
  
  
  let containerView = UIView()
  let containerView2 = UIView()
  let containerView3 = UIView()
  
  //MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setTitleImage()
    setSignUpLabel()
    setIDLabel()
    setPwLabel()
//    setPwConfirmLabel()
    setBackButton()
    setSignInButton()
    idTextField.delegate = self
    pwTextField.delegate = self
    
  }
  
  //MARK: - 패캠 타이틀 로고
  
  func setTitleImage() {
    imageTitle.frame = CGRect(x: 40, y: 80, width: view.frame.width - 80, height: 50)
    imageTitle.image = UIImage(named: "fastcampus_logo.jpg")
    view.addSubview(imageTitle)
  }
  
  //MARK: - 회원가입 레이블
  func setSignUpLabel() {
    signUpLabel.frame = CGRect(x: 80, y: 140, width: view.frame.width - 160, height: 40)
    signUpLabel.text = "회원가입"
    signUpLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    signUpLabel.textAlignment = .center
    signUpLabel.textColor = .black
    view.addSubview(signUpLabel)
  }
  
  //MARK: - 아이디 레이블 세팅
  
  func setIDLabel () {
    
    
    containerView.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 40)
    view.addSubview(containerView)
    
    idLabel.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    idLabel.text = "ID : "
    idLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    idLabel.textAlignment = .center
    idLabel.textColor = .black
    containerView.addSubview(idLabel)
    
    idTextField.frame = CGRect(x: idLabel.frame.maxX + 10, y: 0, width: 200, height: 40)
    idTextField.placeholder = "아이디를 설정하시오"
    idTextField.borderStyle = .none
    idTextField.textAlignment = .left
    idTextField.returnKeyType = .continue
    idTextField.addTarget(self, action: #selector(idTextFieldDidEndonEdit), for: .editingDidEndOnExit)
    containerView.addSubview(idTextField)
  }
  
  //MARK: - 비밀번호 레이블 세팅
  
  func setPwLabel() {
    
    
    containerView2.frame = CGRect(x: 20, y: containerView.frame.maxY + 10, width: view.frame.width - 40, height: 40)
    view.addSubview(containerView2)
    
    pwLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
    pwLabel.text = "PW : "
    pwLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    pwLabel.textAlignment = .center
    pwLabel.textColor = .black
    containerView2.addSubview(pwLabel)
    
    pwTextField.frame = CGRect(x: pwLabel.frame.maxX + 10, y: 0, width: 200, height: 40)
    pwTextField.placeholder = "비밀번호를 설정하시오"
    pwTextField.borderStyle = .none
    pwTextField.textAlignment = .left
    pwTextField.isSecureTextEntry = true
    pwTextField.returnKeyType = .continue
    pwTextField.addTarget(self, action: #selector(pwTextFieldDidEndonEdit), for: .editingDidEndOnExit)
    containerView2.addSubview(pwTextField)
    
  }
  
  //MARK: - 비밀번호 확인 레이블 세팅
  func setPwConfirmLabel () {
    
    containerView3.frame = CGRect(x: 20, y: containerView2.frame.maxY + 10, width: view.frame.width - 40, height: 40)
    view.addSubview(containerView3)
    
    confirmLabel.frame = CGRect(x: 0, y: 0, width: 120, height: 40)
    confirmLabel.text = "비밀번호확인: "
    confirmLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    confirmLabel.textAlignment = .center
    confirmLabel.textColor = .black
    containerView3.addSubview(confirmLabel)
    
    confirmTextField.frame = CGRect(x: confirmLabel.frame.maxX + 10, y: 0, width: 200, height: 40)
    confirmTextField.placeholder = "비밀번호 다시입력"
    confirmTextField.borderStyle = .none
    confirmTextField.textAlignment = .left
    confirmTextField.isSecureTextEntry = true
    confirmTextField.returnKeyType = .done
    confirmTextField.addTarget(self, action: #selector(confirmTextFielddidEndOnEdit), for: .editingDidEndOnExit)
    containerView3.addSubview(confirmTextField)
    
  }

  //MARK: - 키보드 내리기
  @objc func idTextFieldDidEndonEdit(){
    if idTextField.isFirstResponder {
      idTextField.resignFirstResponder()
    }
  }
  
  @objc func pwTextFieldDidEndonEdit(){
    if pwTextField.isFirstResponder {
      pwTextField.resignFirstResponder()
    }
  }
  
  @objc func confirmTextFielddidEndOnEdit(){
    if confirmTextField.isFirstResponder {
      confirmTextField.resignFirstResponder()
    }
  }
  
  //MARK: - 각각 텍스트필드 밑줄
  override func viewDidLayoutSubviews() {
    let border1 = CALayer()
    border1.frame = CGRect(x: 0, y: idTextField.frame.size.height - 1, width: idTextField.frame.width, height: 1)
    border1.backgroundColor = UIColor.black.cgColor
    idTextField.layer.addSublayer((border1))
    
    let border2 = CALayer()
    border2.frame = CGRect(x: 0, y: pwTextField.frame.size.height - 1, width: pwTextField.frame.width, height: 1)
    border2.backgroundColor = UIColor.black.cgColor
    pwTextField.layer.addSublayer((border2))
    
    let border3 = CALayer()
    border3.frame = CGRect(x: 0, y: confirmTextField.frame.size.height - 1, width: confirmTextField.frame.width, height: 1)
    border3.backgroundColor = UIColor.black.cgColor
    confirmTextField.layer.addSublayer((border3))
    
  }
  
  //MARK: - 회원가입 버튼 세팅
  
  func setSignInButton () {
    signInButton.frame = CGRect(x: 30, y: 550, width: view.frame.width - 60, height: 40)
    signInButton.setTitle("회원가입", for: .normal)
    signInButton.setTitleColor(.white, for: .normal)
    signInButton.backgroundColor = .gray
    signInButton.addTarget(self, action: #selector(clickSigninButton), for: .touchUpInside)
    view.addSubview(signInButton)
  }
  
  //MARK: - 회원가입 버튼 클릭 함수
  @objc func clickSigninButton() {
 
    if let loginView = presentingViewController as? LogInPageViewController {
      if loginView.loginCheck.bool(forKey: idTextField.text!) == false {
        loginView.loginCheck.set(pwTextField.text!, forKey: idTextField.text!)
       let alert = UIAlertController(title: "", message: "회원가입이 완료되었습니다!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
               if (self.presentingViewController as? LogInPageViewController) != nil {
                 self.dismiss(animated : true)
               }
             }
        alert.addAction(ok)
            present(alert, animated: true)
        }
      }
  }

   
  
  //MARK: - 돌아가기 버튼 세팅
  
  func setBackButton () {
    backButton.frame = CGRect(x: 30, y: 600, width: view.frame.width - 60, height: 40)
    backButton.setTitle("돌아가기", for: .normal)
    backButton.setTitleColor(.white, for: .normal)
    backButton.backgroundColor = .gray
    backButton.addTarget(self, action: #selector(clickBackButton), for: .touchUpInside)
    view.addSubview(backButton)
  }
  
  //MARK: - 돌아가기 버튼 기능
  @objc func clickBackButton () {
    if let _ = presentingViewController as? LogInPageViewController {
      dismiss(animated: true)
    }
  }
  
  
}



