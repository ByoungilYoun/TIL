//
//  SecondViewController.swift
//  NavigationControllerExample
//
//  Created by 윤병일 on 2020/05/08.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
    
    // 내비게이션 바에서 뒤로 돌아갈때 스스로 돌아간다. 내가 직접 버튼을 눌러서 하고싶으면 안적어줘도 된다.
    override  func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.popViewController(animated: true)
    }
    

    

}
