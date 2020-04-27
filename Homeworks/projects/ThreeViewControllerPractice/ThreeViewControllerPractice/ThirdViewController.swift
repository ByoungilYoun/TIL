//
//  ThirdViewController.swift
//  ThreeViewControllerPractice
//
//  Created by 윤병일 on 2020/04/27.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let button4 = UIButton(type: .system)
    let button5 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button4.setTitle("이전화면 돌아가기", for: .normal)
        button4.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button4.sizeToFit()
        button4.center = CGPoint(x: view.center.x, y: 250)
        button4.addTarget(self, action: #selector(didTapGoBackward(_:)), for: .touchUpInside)
        view.addSubview(button4)
        
        button5.setTitle("처음화면 돌아가기", for: .normal)
        button5.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button5.sizeToFit()
        button5.center = CGPoint(x: view.center.x, y: 350)
        button5.addTarget(self, action: #selector(didTapGoFirstPage(_:)), for: .touchUpInside)
        view.addSubview(button5)
        
        
    }
    

    @objc func didTapGoBackward (_ sender : UIButton){
        dismiss(animated : true)
    }
    

    @objc func didTapGoFirstPage(_ sender : UIButton){
        presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
}
