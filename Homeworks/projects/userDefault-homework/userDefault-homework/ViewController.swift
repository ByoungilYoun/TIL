//
//  ViewController.swift
//  userDefault-homework
//
//  Created by 윤병일 on 2020/05/08.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private struct Key {
        static let dog = "Dog"
        static let cat = "Cat"
    }
    
    @IBOutlet var imageView: UIImageView!
    var image = UIImage()
    
    @IBOutlet var alertSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        let state = userDefaults.bool(forKey: "state")
        
        if state == true {
            imageView.image = UIImage(named: "dog.jpg")
        } else {
            imageView.image = UIImage(named: "cat.jpg")
        }
        
        alertSwitch.setOn(state, animated: true)
        
        
    }
    
    @IBAction func clickSwitchButton(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        if sender.isOn {
            imageView.image = UIImage(named: "dog.jpg")
        } else {
            imageView.image = UIImage(named: "cat.jpg")
        }
        
        userDefaults.set(sender.isOn, forKey: "state")
        
    }
    
    
}

