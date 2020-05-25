//
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
  
  /***************************************************
   UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
   랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
   e.g.
   20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
   40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
   
   < 참고 >
   (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
   ***************************************************/
  
  override var description: String { "Practice 2 - Refresh" }
  let tableView = UITableView()
  
  let maxCount = 20
  let maxRange = 50
  
  //////////////////////// 1)
  lazy var data = Array(1...self.maxCount)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  func setupTableView() {
    ///////// 2)
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    view.addSubview(tableView)
    
    //////// 3)
    let refreshControl = UIRefreshControl()
    refreshControl.tintColor = .blue
    refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  //////// 4)
  @objc func reloadData(){
    data.removeAll() // 랜덤으로 새로 넣어야 하니까 기존에 있던걸 지워주고
    for _ in 1...maxCount {
      data.append((1...maxCount + maxRange).randomElement()!) //그냥 겹치는거 생각하지 않고 할때는 이렇게 하면 된다.
    }
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  // 겹치게 하고 싶지 않을때
  func generateRandomNumber() -> Int {
    #if swift(>=4.2)
    let randomNumber = (0..<maxCount + maxRange).randomElement()!
    #else
    let randomNumber = Int(arc4random_uniform(UInt32(maxCount + maxRange)))
    #endif
    
    guard !data.contains(randomNumber) else {return generateRandomNumber() }
    return randomNumber
}
    }

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    ///////4)
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    /////// 5)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
}
