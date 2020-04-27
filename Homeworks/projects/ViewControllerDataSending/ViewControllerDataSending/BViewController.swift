//
//  BViewController.swift
//  ViewControllerDataSending
//
//  Created by 윤병일 on 2020/04/27.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    
    var label2 = UILabel()
    let button2 = UIButton(type: .system)
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label2.text = "변화된 값은? "
        label2.sizeToFit()
        label2.textAlignment = .center
        label2.center = CGPoint(x: view.center.x, y: 200)
        view.addSubview(label2)
        
        button2.setTitle("A 화면으로 이동", for: .normal)
        button2.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button2.sizeToFit()
        button2.center = CGPoint(x: view.center.x, y: 400)
        button2.addTarget(self, action: #selector(didTapButton2(_:)), for: .touchUpInside)
        view.addSubview(button2)
        
    
        
    }
    
    @objc func didTapButton2 (_ sender : UIButton){
        
        
        if let firstVC = presentingViewController as? AViewController{
                firstVC.count1 += 1
                firstVC.label1.text = "\(firstVC.count1)"
        }
        
        
       
        dismiss(animated : true)
    }


}
