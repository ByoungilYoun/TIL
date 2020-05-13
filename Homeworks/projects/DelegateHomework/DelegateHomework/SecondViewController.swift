//
//  SecondViewController.swift
//  DelegateHomework
//
//  Created by 윤병일 on 2020/05/13.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, FirstViewDelegate {

    private var label = UILabel()
    private var backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setLabel()
        setBackButton()
    }
    
    func sendText (_ text : String) {
        label.text = text
    }
    
    
    func setLabel () {
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.frame = CGRect(x: 30, y: 300, width: view.frame.width - 60, height: 40)
        label.textColor = .black
        label.backgroundColor = .red
        view.addSubview(label)
    }
    
    func setBackButton() {
        backButton.setTitle("뒤로 가기", for: .normal)
        backButton.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        backButton.frame = CGRect(x: 40, y: 500, width: 200, height: 50)
        backButton.setTitleColor(.black, for: .normal)
        backButton.backgroundColor = .orange
        backButton.addTarget(self, action: #selector(clickBackButton), for: .touchUpInside)
        view.addSubview(backButton)
    }
    

    @objc func clickBackButton() {
        self.dismiss(animated: true)
    }
    
    

}
