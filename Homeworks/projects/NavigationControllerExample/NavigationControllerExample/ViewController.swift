//
//  ViewController.swift
//  NavigationControllerExample
//
//  Created by 윤병일 on 2020/05/08.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   lazy var barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController(_:)))
    
    lazy var barButtonItem2 = UIBarButtonItem(title: "Next2", style: .plain, target: self, action: #selector(pushViewController(_:)))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        // iOS 11 이상
        navigationController?.navigationBar.prefersLargeTitles = true
        
       // navigationItem.largeTitleDisplayMode = .never 이걸 쓰면 위에 글씨 크게 하는것이 적용이 안된다. 
        
        title = "FirstPage"
       // navigationItem.title = "FirstVC23" 둘중 편한거 써라
        
//        let barButtonItem2 = UIBarButtonItem(title: "Next2", style: .plain, target: self, action: #selector(pushViewController(_:)))
        
        let barButtonItem3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushViewController(_:)))
        
        navigationItem.rightBarButtonItems = [ barButtonItem2, barButtonItem3]
        
    }
    
    @objc private func pushViewController (_ sender : Any) {
            let secondVC = SecondViewController()
           navigationController?.pushViewController(secondVC, animated: true)
        
        // show(secondVC, sender : sender) - push 대신 이것을 써도 된다. push가 있으면 push 부터
    }


}

