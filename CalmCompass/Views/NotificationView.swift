//
//  NotificationView.swift
//  CalmCompass
//
//  Created by Edgar Backer on 2023-05-19.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(){
        
        let content = UNMutableNotificationContent()
        content.title = "The Notification"
        content.subtitle = "Let's get going!"
        content.sound = .default
        content.badge = 1
        
        //time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 12
        dateComponents.minute = 05
//        dateComponents.weekday = 6
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //location
        //        let coordinates = CLLocationCoordinate2D(
        //            latitude: 40.00,
        //            longitude: 50.00)
        //
        //        let region = CLCircularRegion(
        //            center: coordinates,
        //            radius:100,
        //            identifier: UUID().uuidString)
        //        region.notifyOnEntry = true
        //        region.notifyOnExit = false
        //        let trigger = UNLocationNotificationTrigger(region:region,repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
      UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct NotificationView: View {
    var body: some View {
        VStack(spacing: 40){
            Text("Request permission")
                .onAppear{
                NotificationManager.instance.requestAuthorization()
            }
            Text("Schedule notification")
                .onAppear{
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel notification"){
                NotificationManager.instance.cancelNotification()
            }
        }
            .onAppear {
                UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
