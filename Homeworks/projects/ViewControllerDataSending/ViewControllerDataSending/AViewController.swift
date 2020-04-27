//
//  AViewController.swift
//  ViewControllerDataSending
//
//  Created by 윤병일 on 2020/04/27.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//
//[ 과제 ]
//1. ViewController 데이터 전달
//  > AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
//  > A에서 B로 화면을 넘어갈 때는 B의 Label 값이 이전 값에서 +3 증가
//  > B에서 A로 화면을 넘어갈 때는 A의 Label 값이 이전 값에서 +1 증가
//    e.g. A에서 B로 갈 때 3, B에서 다시 A로 넘어올 때 4, 다시 A에서 B로 가면 7, 다시 A로 오면 8

import UIKit

class AViewController: UIViewController {
    
    
    var label1 = UILabel()
    let button1 = UIButton(type: .system)
    var count1 = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label1.text = "변화된 값은? "
        label1.sizeToFit()
        label1.textAlignment = .center
        label1.center = CGPoint(x: view.center.x, y: 200)
        view.addSubview(label1)
              
        

        button1.setTitle("B 화면으로 이동", for: .normal)
        button1.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button1.sizeToFit()
        button1.center = CGPoint(x: view.center.x, y: 400)
        button1.addTarget(self, action: #selector(didTapButton1(_:)), for: .touchUpInside)
        view.addSubview(button1)
        
       
    }
    

    @objc func didTapButton1 (_ sender : UIButton){
        let secondVC = BViewController()

        secondVC.modalPresentationStyle = .automatic
        secondVC.view.backgroundColor = .cyan
        
        
        count1 += 3
        secondVC.label2.text = "\(count1)"
        
        
        present(secondVC, animated: true)
        
        
        
    }


}
