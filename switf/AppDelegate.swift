//
//  AppDelegate.swift
//  switf
//
//  Created by 睿隆 on 2017/8/17.
//  Copyright © 2017年 睿隆. All rights reserved.
//

import UIKit

// 定义宏
let x = UIScreen.main.bounds.origin.x
let y = UIScreen.main.bounds.origin.y
let w = UIScreen.main.bounds.size.width
let h = UIScreen.main.bounds.size.height
let iPhone5 = CGSize.equalTo(CGSize.init(width: 640, height: 1136))
let iPhone6 = CGSize.equalTo(CGSize.init(width: 750, height: 1334))
let iPhone6p = CGSize.equalTo(CGSize.init(width: 1242, height: 2208))


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = UINavigationController.init(rootViewController:TwoViewController())
 
        
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

