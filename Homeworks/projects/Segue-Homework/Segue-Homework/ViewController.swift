//
//  ViewController.swift
//  Segue-Homework
//
//  Created by 윤병일 on 2020/05/07.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var countDog = 0
    var countCat = 0
    var countBird = 0
    
    @IBOutlet var label1 : UILabel!
    @IBOutlet var label2 : UILabel!
    @IBOutlet var label3 : UILabel!
      
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       
           super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
    
        switch identifier {
        case "dogButton" where countDog < 8 :
            return true
        case "catButton" where countCat < 10 :
            return true
        case "birdButton" where countBird < 15 :
            return true
        default :
            return false
        }
//
//
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let secondVC = segue.destination as? SecondViewController, let identifier = segue.identifier  else {
            return
        }
        
        
        if identifier == "dogButton" {
            countDog += 1
            secondVC.image = UIImage(named: "dog.jpg")
        } else if identifier == "catButton"{
            countCat += 1
            secondVC.image = UIImage(named: "cat.jpg")
        } else {
            countBird += 1
            secondVC.image = UIImage(named: "bird.jpg")
        }
        
        label1.text = "\(countDog)"
        label2.text = "\(countCat)"
        label3.text = "\(countBird)"
        
    }
    
        @IBAction func unwindToFirstPage(_ unwindSegue: UIStoryboardSegue) {
            
           }
           
    @IBAction func unwindToFirstPage2(_ unwindSegue: UIStoryboardSegue) {
        
        if (countDog + 1) < 8 {
            countDog += 1
        }
        
        if (countCat + 1) < 10 {
            countCat += 1
        }
       
        if (countBird + 1) < 15 {
            countBird += 1
        }
        
        label1.text = "\(countDog)"
        label2.text = "\(countCat)"
        label3.text = "\(countBird)"
        
    }
}
    
    


    


