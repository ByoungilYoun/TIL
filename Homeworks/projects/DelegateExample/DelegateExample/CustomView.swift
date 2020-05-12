//
//  CustomView.swift
//  DelegateExample
//
//  Created by 윤병일 on 2020/05/12.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

protocol CustomViewDelegate : class {
    func colorForBackground (_ newColor : UIColor?) -> UIColor
}

class CustomView: UIView {
    
    weak var delegate : CustomViewDelegate?
    
    override var backgroundColor: UIColor? {
        // 내가 한것
//        get { super.backgroundColor}
//        set {
//            super.backgroundColor = newValue
//            print("새로 변경될 색은 :" , super.backgroundColor)
//
//            if super.backgroundColor == .green {
//                return super.backgroundColor = .blue
//            }
//
//            if super.backgroundColor == nil {
//                return super.backgroundColor = .gray
//            }
//        }
        
        // 지운이형 한것
//        get {super.backgroundColor}
//        set {
//            if let newColor = newValue {
//                if newColor == UIColor.systemGreen{
//                    super.backgroundColor == .systemBlue
//                } else {
//                    super.backgroundColor == newColor
//                }
//            } else {
//                super.backgroundColor = .systemGray
//            }
//        }
      
        get { super.backgroundColor}
        set {
            let color = delegate?.colorForBackground(newValue)
            let newColor = color ?? newValue ?? .gray
            
            super.backgroundColor = newColor
            print("새로 변경될 색은 : " , newColor)
        }
        
    }
    
}
