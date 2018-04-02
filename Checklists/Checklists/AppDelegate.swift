//
//  AppDelegate.swift
//  Checklists
//
//  Created by Fernanda Araújo on 27/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    let dataModel = DataModel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                    [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigationController = window!.rootViewController
            as! UINavigationController
        let controller = navigationController.viewControllers[0]
            as! AllListsViewController
        controller.dataModel = dataModel
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        return true
    }
    
    func saveData() {
        dataModel.saveChecklists()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        saveData()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        saveData()
    }

    // MARK:- User Notification Delegates
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler:
                                @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Received local notification \(notification)")
    }
}

