//
//  MainViewController.swift
//  FastCampusLoginPractice2
//
//  Created by 윤병일 on 2020/05/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  var resultLabel = UILabel()
  private var signOutButton = UIButton(type: .system)

  let userDefaults = UserDefaults.standard
  
  //MARK: - ViewDidLoad()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    showResultLabel()
    setSignOutButton()
    
    }
  //MARK: - 결과값 리턴 label
  func showResultLabel () {
    resultLabel.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 50)
    resultLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    resultLabel.text = userDefaults.string(forKey: Key.welcome)
    resultLabel.textAlignment = .center
    view.addSubview(resultLabel)
    
  }
  
  //MARK: - Sign Out 버튼
  func setSignOutButton(){
    signOutButton.frame = CGRect(x: 30, y: 600, width: view.frame.width - 60, height: 40)
    signOutButton.setTitle("Sign Out", for: .normal)
    signOutButton.setTitleColor(.white, for: .normal)
    signOutButton.backgroundColor = .darkGray
    signOutButton.addTarget(self, action: #selector(clickSignOutButton), for: .touchUpInside)
    view.addSubview(signOutButton)
  }
  
  //MARK: - Sign Out 버튼 클릭
  @objc func clickSignOutButton(){
    if let _ = presentingViewController as? LogInPageViewController{
      UserDefaults.standard.set(true, forKey: Key.isLogin)
//      UserDefaults.standard.set(nil, forKey: Key.userId)
      dismiss(animated: true)
    }
  }
    


}
