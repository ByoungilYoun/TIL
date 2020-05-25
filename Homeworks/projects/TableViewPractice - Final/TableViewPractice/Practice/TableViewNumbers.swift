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
  
  let data = Array(1...50) // 그냥 50 쓰는것보다 내가 쓸 변수를 하나 설정해준다.
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    view.addSubview(tableView)
    
    tableView.dataSource = self
   
  }
}

extension TableViewNumbers : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell : UITableViewCell
    
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellID") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
    }
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
  
 
  
}
