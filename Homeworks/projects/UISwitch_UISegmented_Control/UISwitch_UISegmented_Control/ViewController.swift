//
//  ViewController.swift
//  UISwitch_UISegmented_Control
//
//  Created by 윤병일 on 2020/04/27.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultLabel = UILabel()
    var switchButton = UISwitch()
    var segmentedButton = UISegmentedControl(items: ["first", "second", "third"])
    
    var text = ""
    
   

   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        resultLabel.backgroundColor = .cyan
        resultLabel.textColor = .black
        resultLabel.center = CGPoint (x: self.view.frame.width/2, y: 100)
        resultLabel.textAlignment = .center
        view.addSubview(resultLabel)
        
        
        switchButton.frame = CGRect(x: 150, y: 200, width: 50, height: 50)
        switchButton.center = CGPoint(x: self.view.frame.width/2, y: 200)
        switchButton.addTarget(self, action: #selector(clickSwitchButton(_:)), for: .valueChanged)
        view.addSubview(switchButton)
        
        segmentedButton.frame = CGRect(x: 150, y: 300, width: 300, height: 50)
        segmentedButton.center = CGPoint(x: self.view.frame.width/2, y: 300)
        segmentedButton.backgroundColor = .gray
        segmentedButton.addTarget(self, action: #selector(clickSegmentedButton(_:)), for: .valueChanged)
        view.addSubview(segmentedButton)
        
    }

    @objc func clickSwitchButton (_ sender : UISwitch){
        if sender.isOn {
            text = "On"
            
        } else {
            text = "Off"
        }
        
        self.resultLabel.text = text
    }
    
    @objc func clickSegmentedButton (_ array : UISegmentedControl) {
        
        switch array.selectedSegmentIndex {
        case 0 :
            text = "first"
        case 1 :
            text = "second"
        case 2 :
            text = "third"
        default :
            return
            
        }
        self.resultLabel.text = text
}
}
