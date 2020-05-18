//
//  ViewController.swift
//  AutoLayout_Anchors
//
//  Created by 윤병일 on 2020/05/18.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let redView = UIView()
  private let blueView = UIView()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    redView.backgroundColor = .red
    blueView.backgroundColor = .blue
    
    
    
    view.addSubview(redView)
    view.addSubview(blueView)
    
    activeLayoutAnchors()
    
  }
  
  private func activeLayoutAnchors() {
    redView.translatesAutoresizingMaskIntoConstraints = false
  
    redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    redView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: -10).isActive = true
    
//    redView.widthAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 1).isActive = true
//
//    redView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
  
    redView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true

    
    blueView.translatesAutoresizingMaskIntoConstraints = false
    blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 10).isActive = true
    blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//    blueView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1).isActive = true
    
  }
  
  
  


}

