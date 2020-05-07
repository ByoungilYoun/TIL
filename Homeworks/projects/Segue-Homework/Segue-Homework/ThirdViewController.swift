//
//  ThirdViewController.swift
//  Segue-Homework
//
//  Created by 윤병일 on 2020/05/07.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var dogCount = 0 {
        didSet {
            label1.text = "\(dogCount)"
        }
        
    }
    var catCount = 0 {
        didSet {
            label2.text = "\(catCount)"
        }
    }
    var birdCount = 0 {
        didSet {
            label3.text = "\(birdCount)"
        }
    }
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction private func performManualSegue(_ sender : Any) {
        guard let title = (sender as? UIButton)?.currentTitle else {
            return
        }
        switch title {
        case "Dog" :
            guard dogCount < 8  else {return}
            performSegue(withIdentifier: "dog", sender: self)
        case "Cat" :
            guard catCount < 10 else {return}
            performSegue(withIdentifier: "cat", sender: self)
        case "Bird" :
            guard birdCount < 15 else {return}
            performSegue(withIdentifier: "bird", sender: self)
        default :
            return
        }
        
        if let fourthVC = self.presentedViewController as? FourthViewController {
            switch title {
            case "Dog" :
                fourthVC.imageView.image = UIImage(named: "dog.jpg")
                dogCount += 1
            case "Cat" :
                fourthVC.imageView.image = UIImage(named: "cat.jpg")
                catCount += 1
            case "Bird" :
                fourthVC.imageView.image = UIImage(named: "bird.jpg")
                birdCount += 1
            default :
                return
            }
        }
        
    }
    
//    @IBAction func wind (_ sender : Any) {
//        self.performSegue(withIdentifier: "dog", sender: self)
//
//        dogCount += 1
//
//        let fourthVC = presentedViewController as? FourthViewController
//        fourthVC?.imageView.image = UIImage(named: "dog.jpg")!
//
//    }
//
//    @IBAction func wind2 (_ sender : Any) {
//        self.performSegue(withIdentifier: "cat", sender: self)
//
//        catCount += 1
//
//        let fourthVC = presentedViewController as? FourthViewController
//        fourthVC?.imageView.image = UIImage(named: "cat.jpg")!
//
//    }
//
//    @IBAction func wind3 (_ sender : Any) {
//        self.performSegue(withIdentifier: "bird", sender: self)
//
//        birdCount += 1
//
//        let fourthVC = presentedViewController as? FourthViewController
//        fourthVC?.imageView.image = UIImage(named: "bird.jpg")!
//    }
    
    @IBAction func unwindToThirdPage ( _ unwindSegue : UIStoryboardSegue){
        
    }

}
