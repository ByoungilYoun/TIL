//
//  TableViewNumbers.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewNumbers: UIViewController {
  
  /***************************************************
   1부터 50까지의 숫자 출력하기
   ***************************************************/
  
  override var description: String { "Practice 1 - Numbers" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    view.addSubview(tableView)
  }
}

extension TableViewNumbers {
}
