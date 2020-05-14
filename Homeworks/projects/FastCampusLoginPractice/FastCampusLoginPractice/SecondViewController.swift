//
//  SecondViewController.swift
//  FastCampusLoginPractice
//
//  Created by 윤병일 on 2020/05/14.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    private var resultLabel = UILabel()
    private var signOutButton = UIButton(type: .system)
    var resultEmail = ""
    private var welcomeLabel = UILabel()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setResultLabel()
        setSignOutButton()
        setWelcomeLabel()
        
        
        
    }
    
    func setWelcomeLabel() {
        welcomeLabel.frame = CGRect(x: 30, y: 50, width: view.frame.width - 60, height: 40)
        welcomeLabel.text = "환영합니다!"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .black
        welcomeLabel.sizeToFit()
        view.addSubview(welcomeLabel)
    }
    

    func setResultLabel() {
        resultLabel.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 40)
        resultLabel.text = resultEmail
        view.addSubview(resultLabel)
    }
   
    func setSignOutButton(){
        signOutButton.frame = CGRect(x: 20, y: 600, width: view.frame.width - 40, height: 40)
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.white, for: .normal)
        signOutButton.backgroundColor = .gray
        signOutButton.addTarget(self, action: #selector(clickSignOutButton), for: .touchUpInside)
        view.addSubview(signOutButton)
    }
    
   
    @objc func clickSignOutButton(){
        if let _ = presentingViewController as? ViewController {
            UserDefaults.standard.set(true, forKey: "isLogin")
//            print(UserDefaults.standard.bool(forKey: "isLogin"))
            dismiss(animated: true)
        }
        
    }

}
