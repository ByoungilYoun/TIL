//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
  
  /***************************************************
   Data :  x ~ y까지의 숫자 (x, y는 임의의 숫자) (10 ~ 50, 60 ~ 78, 0 ~ 100)
   섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
   
   e.g.
   섹션 0 - 0부터 9까지의 숫자
   섹션 1 - 10부터 19까지의 숫자
   ...
   
   let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
   위 데이터가 주어지면
   섹션 0 - 5, 7
   섹션 1 - 16, 19
   섹션 2 - 22, 29
   ...
   ***************************************************/
  
  override var description: String { "Practice 3 - Section" }
  
  let tableView = UITableView()
  let refreshData = UIRefreshControl()
  
  var data = Array(1...100)
  var numberCategories: [Int: [Int]] = [:]
  var sectionTitles: [Int] = []
  var count = 0
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createTableView()
    putInDic()
    putInArr()
    createRefresh()
    
  }
  
  func createTableView() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    tableView.refreshControl = refreshData
    view.addSubview(tableView)
  }
  func createRefresh() {
    refreshData.tintColor = .blue
    refreshData.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshData.addTarget(self, action: #selector(reloadData), for: .valueChanged)
  }
  
  func putInDic () {
    numberCategories[0] = []
    for index in data {
      if index % 10 == 0 {
        count += 1
        numberCategories.updateValue([index], forKey: count)
      } else {
        numberCategories[count]?.append(index)
      }
    }
  }
  
  func putInArr() {
    sectionTitles = numberCategories.keys.sorted()
  }
  @objc func reloadData() {
    numberCategories.removeAll()
//    data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    data = [1,2,3,4,5,11]
    putInDic()
    putInArr()
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return String(sectionTitles[section])
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    sectionTitles.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberCategories[sectionTitles[section]]!.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    let numCheck = numberCategories[sectionTitles[indexPath.section]]
    cell.textLabel?.text = "\(numCheck![indexPath.row])"
    return cell
  }
}

