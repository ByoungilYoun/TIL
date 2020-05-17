//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by 윤병일 on 2020/05/17.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//
// 호출순서
// viewWillAppear
// viewSafeAreaInsetsDidChange
// viewWillLayoutSubviews
// viewDidLayoutSubViews
// viewDidAppear

import UIKit

class ViewController: UIViewController {

  private var redView = UIView()
  private var blueView = UIView()
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    let margin : CGFloat = 20
    let padding : CGFloat = 10
    let safeLayoutInsets = view.safeAreaInsets
    let horizontalInsents = safeLayoutInsets.left + safeLayoutInsets.right
    
    let offYset = safeLayoutInsets.top + margin
    let viewWidth = (view.frame.width - padding - horizontalInsents) / 2  - margin
    
    redView.frame = CGRect(x: safeLayoutInsets.left + margin, y: offYset, width: viewWidth, height: view.bounds.height - offYset - (safeLayoutInsets.bottom + margin))
    redView.backgroundColor = .red
    view.addSubview(redView)
    
    blueView.frame = CGRect(origin: CGPoint(x: redView.frame.maxX + padding, y: offYset), size: redView.bounds.size )
    blueView.backgroundColor = .blue
    view.addSubview(blueView)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
  }


}

