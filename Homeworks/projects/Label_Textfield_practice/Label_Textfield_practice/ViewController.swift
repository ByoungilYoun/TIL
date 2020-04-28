//
//  ViewController.swift
//  Label_Textfield_practice
//
//  Created by 윤병일 on 2020/04/28.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label = UILabel()
    var textField = UITextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.sizeToFit()
        label.frame = CGRect (x: 30, y: 300, width: 300, height: 50)
//        label.center = view.center
        label.backgroundColor = .orange
        view.addSubview(label)
        
        textField.frame = CGRect(x: 30, y: 400, width: 300, height: 50)
        textField.placeholder = "입력하시오"
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin(_:)), for: .editingDidBegin)

        textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        textField.addTarget(self, action: #selector(textFieldDidEndOnExit(_:)), for: .editingDidEndOnExit)
        
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd(_:)), for: .editingDidEnd)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }

    @objc func textFieldEditingDidBegin(_ sender: UITextField) {
      
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: 40)
        
        }
    
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        if textField.text!.count <= 10 {
            label.text = "\(textField.text!)"
        } else {
            let alertController = UIAlertController(title: "경고", message: "글자수가 10 이상입니다", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "다시 시도", style: .cancel) { _ in
                self.label.text = ""
                self.textField.text = ""
                
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
    
        }
       
        
        
    }
    
    
    @objc func textFieldDidEndOnExit(_ sender: UITextField) {
        label.text = "\(textField.text!)"
        
    }
    
    @objc func textFieldEditingDidEnd(_ sender: UITextField) {
   
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 20)
    }
    
  
    

}
