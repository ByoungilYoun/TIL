//
//  ViewController.swift
//  DelegateExample
//
//  Created by 윤병일 on 2020/05/12.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
 
    

    @IBOutlet private weak var customView : CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. 바꿀 때 마다 직접 입력
        //2. 뷰 컨트롤러에 메서드 작성
        //3. 커스텀 뷰 구현
        
        //changeBackgroundColor()
        
        // green -> blue
        // nil -> gray
//        customView.backgroundColor = .red
//        customView.backgroundColor = .green
//        customView.backgroundColor = nil
       
        customView.delegate = self
        customView.backgroundColor = .black
    }
}
//    func changeBackgroundColor () {
//          let colors : [UIColor] = [.systemBlue, .systemRed, .systemGreen, .systemYellow]
//        customView.backgroundColor = colors.randomElement()!
//        print(customView.backgroundColor)
//
//}
    extension ViewController : CustomViewDelegate {
    func colorForBackground(_ newColor: UIColor?) -> UIColor {
        guard let color = newColor else { return . gray}
        return color != .red ? color : .red
       }

}


    extension ViewController : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch text {
        case "red" : customView.backgroundColor = .red
        case "blue" : customView.backgroundColor = .blue
        case "black" : customView.backgroundColor = .black
        default : customView.backgroundColor = .gray
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true 
    }
}


