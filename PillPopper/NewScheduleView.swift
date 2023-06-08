//
//  NewSchedule.swift
//  PillPopper
//
//  Created by Kevin Buchholz on 5/12/23.
//

import SwiftUI
//import UserNotifications
//
//class NotificationManager {
////    var takePill: Date = Date()
//    static let instance = NotificationManager()
//    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//    func requestAuthorization() {
//        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
//            if let error = error {
//                print("Error: \(error)")
//            } else {
//                print("Success")
//            }
//        }
//    }
//
//    func scheduleNotification(date: Date){
//        let content = UNMutableNotificationContent()
//        content.title = "Take your pill."
//        content.subtitle = "It's good for you."
//        content.sound = .default
//        content.badge = 1
//
////        var dateComponents = DateComponents()
////        dateComponents.hour = 10
////        dateComponents.minute = 00
////        dateComponents.weekday = 2
//
//        let dateComponents = Calendar.current.dateComponents([.hour, .minute, .timeZone], from: date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
////            let trigger = takePill
//
//        let request = UNNotificationRequest(
//            identifier: UUID().uuidString,
//            content: content,
//            trigger: trigger)
//        UNUserNotificationCenter.current().add(request)
//    }
//    func cancelNotifications() {
//        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
//    }
//}
//
//

struct NewScheduleView: View {
   
    
    var userLocale = Locale.autoupdatingCurrent
    var gregorianCalendar = Calendar(identifier: .gregorian)
    @State var takePill : Date = Date()
    @State var timeLine = [Date]()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = .autoupdatingCurrent
//        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.timeZone = .autoupdatingCurrent
        return formatter
    }()
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Button("Allow notifications") {
                    NotificationManager.instance.requestAuthorization()
                }
                Text("What time do you want to medicate?")
                    .font(.largeTitle)
                    .frame(alignment: .center)
                DatePicker("Pick a time", selection: $takePill, displayedComponents: .hourAndMinute)
//                    .datePickerStyle(GraphicalDatePickerStyle())
//                    .frame(maxHeight: 400)
                    .labelsHidden()
                Text("\(takePill, formatter: dateFormatter)")
                Button("Add time.") {
                    NotificationManager.instance.scheduleNotification(date: takePill)
                    timeLine.append(takePill)
                    print("\(Date())")
                    print("\(takePill.formatted())")
                    print("The time line is: \(timeLine)")
//                    print("\(takePill, formatter: dateFormatter)")
                    }
               
                Button("Clear All") {
                    NotificationManager.instance.cancelNotifications()
                }
                .padding()
            }
        }
    }
}

struct NewScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NewScheduleView()
    }
}
