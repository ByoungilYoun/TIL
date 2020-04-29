//
//  FirstViewController.swift
//  200429_MyAlertController
//
//  Created by 윤병일 on 2020/04/29.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var content = "Display" {
        didSet {
            displayLabel.text = content
        }
    }
    
    
    private let displayLabel = UILabel()
    private let alertButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseUI()
    }
    
    private func baseUI () {
        
        view.backgroundColor = .white
        
        displayLabel.text = content
        displayLabel.textColor = .white
        displayLabel.backgroundColor = .black
        displayLabel.textAlignment = .center
        displayLabel.frame.size = CGSize(width: 200, height: 40)
        displayLabel.center = CGPoint(x: view.center.x, y: 200)
        view.addSubview(displayLabel)
        
        alertButton.setTitle("Alert", for: .normal)
        alertButton.frame.size = CGSize(width: 200, height: 40)
        alertButton.center = view.center
        alertButton.backgroundColor = .green
        alertButton.addTarget(self, action: #selector(alertButtonAction), for: .touchUpInside)
        view.addSubview(alertButton)
        
        
    }
    
    @objc private func alertButtonAction() {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .overFullScreen
        secondVC.titleLabel.text = "Title"
        secondVC.messageLabel.text = "Message"
        present(secondVC, animated: true)
    }

    
}
