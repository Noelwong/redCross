//
//  NotificationViewController.swift
//  FirebaseApp
//
//  Created by james on 27/3/18.
//  Copyright © 2018年 Robert Canton. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){(success, error) in
            
            if error != nil {
                print("Authorization Unsuccessful")
            }else{
                print("Authorization Successful")
            }
            
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func notifyPressed(_ sender: UIButton) {
        timedNotifications(inSeconds: 3) {(success) in
            if success {
                print("Successfully Notified")
            }
        }
    }
    
    func timedNotifications(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) ->()){
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let content = UNMutableNotificationContent()
        
        content.title = "Emergency Notice"
        content.subtitle = ""
        content.body = "It is not enough blood, we need you help!!"
        
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) {(error) in
            if error != nil {
                completion(false)
            }else{
                completion(true)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
