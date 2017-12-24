//
//  Project21_HomePage.swift
//  Project_HackingWithSwift
//
//  Created by 魏品軒 on 2017/12/24.
//  Copyright © 2017年 魏品軒. All rights reserved.
//

import UIKit
import UserNotifications

class Project21_HomePage: UIViewController {
    // MARK: - Properties
    
    // MARK: - IBOutlet
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Project21_LocalNotifications"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: self, action: #selector(Button))

    }
    // MARK: - IBAction
    
    // MARK: - Public
    @objc func Button(){
        let ac = UIAlertController(title: "Choose", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Register", style: .default, handler: registerLocal))
        ac.addAction(UIAlertAction(title: "scheduleLocal", style: .default, handler: scheduleLocal))
        
        present(ac, animated: true)
    }
    func registerLocal(action: UIAlertAction) {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    func scheduleLocal(action: UIAlertAction) {
        registerCategories()
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 16
//        dateComponents.minute = 00
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Tell me more…", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
    }
    // MARK: - Private
    

}
extension Project21_HomePage: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // pull out the buried userInfo dictionary
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("Custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock
                print("Default identifier")
                
            case "show":
                // the user tapped our "show more info…" button
                print("Show more information…")
                
            default:
                break
            }
        }
        
        // you must call the completion handler when you're done
        completionHandler()
    }
}
