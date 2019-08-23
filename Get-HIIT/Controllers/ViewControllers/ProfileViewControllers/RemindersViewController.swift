//
//  RemindersViewController.swift
//  Get-HIIT
//
//  Created by Timothy Rosenvall on 8/21/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit
import UserNotifications

class RemindersViewController: UIViewController {
    
    @IBOutlet weak var remindersSwitch: UISwitch!
    @IBOutlet weak var reminderTimePicker: UIDatePicker!
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var enableInSettingsButton: UILabel!
    
    let notificationCenter = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    let profile = ProfileController.sharedInstance.profile

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func remindersSwitchTapped(_ sender: Any) {
        profile.notificationsEnabled = !profile.notificationsEnabled
        requestNotificationAuthorization()
        setupViews()
    }
    
    func setupViews() {
        notificationCenter.getNotificationSettings { (settings) in
            let auth = settings.authorizationStatus
            DispatchQueue.main.async {
                if auth == .denied {
                    self.remindersSwitch.isEnabled = false
                } else {
                    self.remindersSwitch.isEnabled = true
                }
            }
        }
        remindersSwitch.isOn = profile.notificationsEnabled
        remindMeLabel.isHidden = !profile.notificationsEnabled
        reminderTimePicker.isHidden = !profile.notificationsEnabled
    }
    
    
    func requestNotificationAuthorization() {
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("Error requesting notification authorization")
            }
            
            DispatchQueue.main.async {
                if !didAllow {
                    print("User has declined notifications")
                    self.remindersSwitch.isOn = false
                    self.remindersSwitch.isEnabled = false
                }
            }
        }
    }
    
    func getNotificationAuthorizationStatus() {
        notificationCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
            }
        }
    }
    
    func scheduleNotification(notificationType: String) {
        
        let content = UNMutableNotificationContent()
        
        content.title = notificationType
        content.body = "This is example how to create " + notificationType
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let date = Date(timeIntervalSinceNow: 3600)
        let triggerDate = Calendar.current.dateComponents([.hour,.minute,.second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
