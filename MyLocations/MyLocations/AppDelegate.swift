//
//  AppDelegate.swift
//  MyLocations
//
//  Created by Fernanda Araújo on 02/04/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: {
            storeDescription, error in
            if let error = error {
                fatalError("Could load data store: \(error)")
            }
        })
        return container
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = self.persistentContainer.viewContext
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let tabController = window!.rootViewController as! UITabBarController
        
        if let tabViewControllers = tabController.viewControllers {
            var navController = tabViewControllers[0]
                as! UINavigationController
            let controller1 = navController.viewControllers.first
                as! CurrentLocationViewController
            controller1.managedObjectContext = managedObjectContext

            navController = tabViewControllers[1]
                as! UINavigationController
            let controller2 = navController.viewControllers.first
                as! LocationsViewController
            controller2.managedObjectContext = managedObjectContext
            
            let _ = controller2.view
            
            navController = tabViewControllers[2] as! UINavigationController
            let controller3 = navController.viewControllers.first
                as! MapViewController
            controller3.managedObjectContext = managedObjectContext
        }
        
        print(applicationDocumentsDirectory)
        listenForFatalCoreDataNotifications()
        
        return true
    }

    // MARK:- Helper methods
    func listenForFatalCoreDataNotifications() {

        NotificationCenter.default.addObserver(
            forName: CoreDataSaveFailedNotification,
            object: nil, queue: OperationQueue.main,
            using: { notification in
                let message = """
                    There was a fatal error in the app and it cannot continue.
                    Press OK to terminate the app. Sorry for the inconvenience.
                    """
                let alert = UIAlertController(
                    title: "Internal Error", message: message,
                    preferredStyle: .alert)

                let action = UIAlertAction(title: "OK",
                                           style: .default) { _ in
                                            let exception = NSException(
                                                name: NSExceptionName.internalInconsistencyException,
                                                reason: "Fatal Core Data error", userInfo: nil)
                                            exception.raise()
                }
                alert.addAction(action)

                let tabController = self.window!.rootViewController!
                tabController.present(alert, animated: true,
                                      completion: nil)
        })
    }

}

