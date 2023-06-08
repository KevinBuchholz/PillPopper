//
//  NotificationModel.swift
//  PillPopper
//
//  Created by Kevin Buchholz on 5/14/23.
//

import Foundation
import UserNotifications

class NotificationManager: ObservableObject {
//    @Published var takePill : Date = Date()
//    @Published var timeLine = [Date]()

//    var takePill: Date = Date()
    static let instance = NotificationManager()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification(date: Date){
        let content = UNMutableNotificationContent()
        content.title = "Take your pill."
        content.subtitle = "It's good for you."
        content.sound = .default
        content.badge = 1
//        content.
        
       
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 10
//        dateComponents.minute = 00
//        dateComponents.weekday = 2
       
        let dateComponents = Calendar.current.dateComponents([.hour, .minute, .timeZone], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//            let trigger = takePill
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

    







