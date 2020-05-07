//
//  SecondViewController.swift
//  Segue-Homework
//
//  Created by 윤병일 on 2020/05/07.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  
    @IBOutlet var imageView: UIImageView!
    var image : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image 
        
       
    }
    

   

}
