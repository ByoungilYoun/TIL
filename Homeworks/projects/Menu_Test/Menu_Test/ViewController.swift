//
//  ViewController.swift
//  Menu_Test
//
//  Created by 윤병일 on 2020/05/01.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count1 = 0
    var count2 = 0
    var count3 = 0
    var count4 = 0
    var count5 = 0
    var leftMoney = 70000
    
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    
    var label4 = UILabel()
    var label5 = UILabel()
    var label6 = UILabel()
    var label7 = UILabel()
    
    var rsButton = UIButton(type: .system)
    var payButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showDisplay1()
        showDisplay2()
        showDisplay3()
        showDisplay4()
        showResetButton()
        showPayButton()
        
        
    }

    @IBAction func clickBtn1(_ sender: Any) {
        count1 += 1
        self.label1.text = "\(count1)"
        
        count4 += 5000
        self.label7.text = "\(count4)원"
        
        
    }
    
    @IBAction func clickBtn2(_ sender: Any) {
        count2 += 1
        self.label2.text = "\(count2)"
        
        count4 += 6000
        self.label7.text = "\(count4)원"
    }
    
    @IBAction func clickBtn3(_ sender: Any) {
        count3 += 1
        self.label3.text = "\(count3)"
        
        count4 += 12000
        self.label7.text = "\(count4)원"
    }
   
    func showDisplay1() {
        label4.text = "소지금"
        label4.textAlignment = .center
        label4.backgroundColor = .green
        label4.frame = CGRect(x: 20, y: 400, width: 80, height: 40)
        view.addSubview(label4)
        
    }
    
    func showDisplay2() {
        label5.text = "\(leftMoney)원"
        label5.textAlignment = .right
        label5.backgroundColor = .green
        label5.frame = CGRect(x: 110, y: 400, width: 140, height: 40)
        view.addSubview(label5)
    }
    
    func showDisplay3(){
        label6.text = "결제금액"
        label6.textAlignment = .center
        label6.backgroundColor = .orange
        label6.frame = CGRect(x: 20, y: 450, width: 80, height: 40)
        view.addSubview(label6)
        
    }
    
    func showDisplay4(){
        label7.text = "0원"
        label7.textAlignment = .right
        label7.backgroundColor = .orange
        label7.frame = CGRect(x: 110, y: 450, width: 140, height: 40)
        view.addSubview(label7)
    }
    
    func showResetButton() {
        rsButton.setTitle("초기화", for: .normal)
        rsButton.setTitleColor(.white, for: .normal)
        rsButton.backgroundColor = .black
        rsButton.frame = CGRect(x: 270, y: 400, width: 80, height: 40)
        rsButton.addTarget(self, action: #selector(clickResetButton), for: .touchUpInside)
        view.addSubview(rsButton)
        
    }
    
    func showPayButton(){
        payButton.setTitle("결제", for: .normal)
        payButton.setTitleColor(.white, for: .normal)
        payButton.backgroundColor = .black
        payButton.frame = CGRect(x: 270, y: 450, width: 80, height: 40)
        payButton.addTarget(self, action: #selector(clickPayButton), for: .touchUpInside)
        view.addSubview(payButton)
    }
    
   @objc func clickResetButton(){
        count1 = 0
        count2 = 0
        count3 = 0
        count4 = 0
        leftMoney = 70000
        
        self.label1.text = "\(count1)"
        self.label2.text = "\(count2)"
        self.label3.text = "\(count3)"
        self.label5.text = "\(leftMoney)원"
        self.label7.text = "\(count4)원"
        
        
    }
    
    @objc func clickPayButton(){
        if self.leftMoney >= self.count4 {
            let alert = UIAlertController(title: "결제하기", message: "총 결제금액은 \(count4)원 입니다.", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "확인", style: .default){ (_) in
                self.leftMoney -= self.count4
                self.label5.text = "\(self.leftMoney)원"
                self.count1 = 0
                self.count2 = 0
                self.count3 = 0
                self.count4 = 0
                self.label1.text = "\(self.count1)"
                self.label2.text = "\(self.count2)"
                self.label3.text = "\(self.count3)"
                self.label7.text = "\(self.count4)원"
            }
            alert.addAction(cancel)
            alert.addAction(ok)
                              
            present(alert , animated: true)
            
        } else {
            let alert2 = UIAlertController(title: "", message: "소지금액이 부족합니다.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert2.addAction(ok)
            
            present(alert2, animated: true)
        }
    }
    
}
        

       
       
 

