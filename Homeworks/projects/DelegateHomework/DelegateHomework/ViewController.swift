//
//  ViewController.swift
//  DelegateHomework
//
//  Created by 윤병일 on 2020/05/12.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//[ 과제 ]
//Delegate 를 이용하여 FirstVC의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
//1-1. delegate 프로토콜과 프로퍼티를 firstVC 에 정의하는 방법으로 구현
//     e.g. class FirstVC { weak var delegate: ~~~ }
//1-2. delegate 프로토콜과 프로퍼티를 secondVC 에 정의하는 방법으로 구현
//     e.g. class SecondVC { weak var delegate: ~~~ }

import UIKit

protocol FirstViewDelegate : class {
    func sendText (_ text : String)
}

class ViewController: UIViewController {

    private var textField = UITextField()
    private var button = UIButton(type: .system)
    
    weak var delegate : FirstViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        setTextField()
        setButton()
    }

    func setTextField() {
        textField.placeholder = "입력하시오 :"
        textField.borderStyle = .roundedRect
        textField.frame = CGRect(x: 30, y: 300, width : view.frame.width - 60, height: 40)
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.textAlignment = .left
        textField.keyboardAppearance = .dark
        view.addSubview(textField)
    }
    
    func setButton () {
        button.setTitle("다음화면", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        button.frame = CGRect(x: 40, y: 500, width: 200, height: 50)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        }
    
    @objc func clickButton(_ sender : UIButton) {
        let secondVC = SecondViewController()
        delegate = secondVC
        self.delegate?.sendText(self.textField.text ?? "")
//        secondVC.modalPresentationStyle = .fullScreen
//          secondVC.view.backgroundColor = .blue
        
        present(secondVC , animated: true)
        
    }

}

