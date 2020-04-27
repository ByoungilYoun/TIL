//
//  SecondViewController.swift
//  ThreeViewControllerPractice
//
//  Created by 윤병일 on 2020/04/27.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {

    let button2 = UIButton(type : .system)
    let button3 = UIButton(type : .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button2.setTitle("Move Forward", for: .normal)
        button2.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button2.sizeToFit()
        button2.center = CGPoint(x: view.center.x, y: 250)
        button2.addTarget(self, action: #selector(didTapButtonForward(_:)), for: .touchUpInside)
        view.addSubview(button2)
        
        button3.setTitle("Move Backward", for: .normal)
        button3.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button3.sizeToFit()
        button3.center = CGPoint(x: view.center.x, y: 350)
        button3.addTarget(self, action: #selector(didTapButtonBackword(_:)), for: .touchUpInside)
        view.addSubview(button3)
        
    }
    
    @objc func didTapButtonForward(_ sender : UIButton){
        let thirdVC = ThirdViewController()
//        thirdVC.modalPresentationStyle = .fullScreen
        thirdVC.modalPresentationStyle = .automatic
        thirdVC.view.backgroundColor = .gray
        present(thirdVC, animated: true)
        
    }
    
    @objc func didTapButtonBackword(_ sender : UIButton){
        dismiss(animated: true)
    }
    
}
