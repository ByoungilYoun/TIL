//
//  ViewController.swift
//  ThreeViewControllerPractice
//
//  Created by 윤병일 on 2020/04/27.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//
//문제: 3개의 뷰 컨트롤러 사이에 화면 전환하기
//     A는 B로 가는 버튼
//     B는 A로 돌아가는 dismiss 버튼과 C로 가는 버튼
//     C는 A 또는 B로 돌아가는 dismiss 버튼
//
//(참고)
//A -> B
//  <- B -> C
//     B <- C
//A   <-    C






import UIKit

class ViewController: UIViewController {

    let buttonA = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        buttonA.setTitle("Move", for: .normal)
        buttonA.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        buttonA.sizeToFit()
        buttonA.center = view.center
        buttonA.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(buttonA)
        
        
    }
    
    @objc func didTapButton (_ sender : UIButton) {
        let secondVC = SecondViewController()
//        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalPresentationStyle = .automatic
        secondVC.view.backgroundColor = .orange
        present(secondVC, animated: true)
    }


}

