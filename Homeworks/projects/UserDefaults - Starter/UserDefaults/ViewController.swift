//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2020. 05. 06..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private struct Key {
        static let today = "Today"
        static let alarmOn = "AlarmOn"
    }
    
  @IBOutlet private weak var datePicker: UIDatePicker!
  @IBOutlet private weak var alertSwitch: UISwitch!

  // MARK: Action Handler
  
  @IBAction func saveData(_ button: UIButton) {
    // UserDefaults 를 이용해서 Alarm switch 의 값 저장
    // datePicker 의 값 저장

    // 강사님이 한것
//    let userDefaults = UserDefaults.standard
//    userDefaults.set(datePicker.date, forKey: Key.today)
//    userDefaults.set(alertSwitch.isOn, forKey: Key.alarmOn)

    let userDefaults = UserDefaults.standard
    userDefaults.set(datePicker.date, forKey: Key.today)
    userDefaults.set(alertSwitch.isOn, forKey: Key.alarmOn)

    
// 내가 한것
//    UserDefaults.standard.set(datePicker.date, forKey: "datePicker")
//
//    UserDefaults.standard.set(alertSwitch.isOn, forKey: "setAlarm")

  }
  
  @IBAction func loadData(_ button: UIButton) {
    
    // Alarm Switch 값 로드, datePicker 의 값 불러오기
    // Switch 와 datePicker 에 불러온 값을 세팅
    // 강사님이 한것
//    let userDefaults = UserDefaults.standard
//
//    let today = (userDefaults.object(forKey: Key.today) as? Date) ?? Date ()
//    let isAlarmOn = userDefaults.bool(forKey: Key.alarmOn)
//
//    datePicker.setDate(today, animated: true)
//    alertSwitch.setOn(isAlarmOn, animated: true)
    
    let userDefaults = UserDefaults.standard
    
    let today = (userDefaults.object(forKey: Key.today) as? Date) ?? Date()
    let isAlarmOn = userDefaults.bool(forKey: Key.alarmOn)
    
    datePicker.setDate(today, animated: true)
    alertSwitch.setOn(isAlarmOn, animated: true)
//  내가 한것
//    if let date = UserDefaults.standard.object(forKey: "datePicker") as? Date {
//        datePicker.setDate(date, animated: true)
//    }
//
//    if let alarm = UserDefaults.standard.object(forKey: "setAlarm") as? Bool {
//        alertSwitch.setOn(alarm, animated: true)
//    }

  }
}

