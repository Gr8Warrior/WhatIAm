//
//  AppDelegate.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/4/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  var baseViewController: UITabBarController?
  
  func createTabs() {
    
    var tabControllers: [UIViewController] = []
    
    for i in 0..<4 {
    
      var viewcontroller: UIViewController?
      var navigationController: UINavigationController?
      
      switch i {
        
      case 0:
          viewcontroller = ProfileViewController()
          navigationController = UINavigationController(rootViewController: viewcontroller!)
          navigationController?.tabBarItem.title = "Profile"
          navigationController?.navigationBar.topItem?.title = "profile"
          navigationController?.tabBarItem.image = UIImage(named: "profile")

        
        case 1:
          viewcontroller = FeedsViewController()
          
          navigationController = UINavigationController(rootViewController: viewcontroller!)
          navigationController?.tabBarItem.title = "Feed"
          navigationController?.navigationBar.topItem?.title = "Feeds"
          navigationController?.tabBarItem.image = UIImage(named: "feed")
        
      case 2:
        viewcontroller = GalleryViewController()
        navigationController = UINavigationController(rootViewController: viewcontroller!)
        navigationController?.tabBarItem.title = "Gallery"
        navigationController?.navigationBar.topItem?.title = "Gallery"
        navigationController?.tabBarItem.image = UIImage(named: "gallery")
        
        
      case 3:
        viewcontroller = MapsViewController()
        navigationController = UINavigationController(rootViewController: viewcontroller!)
        navigationController?.tabBarItem.title = "Maps"
        navigationController?.navigationBar.topItem?.title = "Maps"
        navigationController?.tabBarItem.image = UIImage(named: "maps")
        
        default:
        viewcontroller = nil
      }
      
      tabControllers.append(navigationController!)
    }
    
    baseViewController = UITabBarController()
    baseViewController?.viewControllers = tabControllers
  }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    createTabs()
    window?.rootViewController = baseViewController
    
    return true
    
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

