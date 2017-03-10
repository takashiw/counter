//
//  AppDelegate.swift
//  counter
//
//  Created by Takashi Wickes on 3/9/17.
//  Copyright © 2017 takashiw. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locking: Bool = false
    var observers = [NSObjectProtocol]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let callback: @convention(c)
            (CFNotificationCenter?, UnsafeMutablePointer<Void>, CFString?, UnsafeRawPointer,        CFDictionary?) -> Void = {
                (center, observer, name, object, userInfo) in
                
                //Execute callback code
                print(name)
                
        }
        
        let exCb: CFNotificationCallback = unsafeBitCast(callback, to: CFNotificationCallback.self)
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),nil ,exCb,"com.apple.springboard.lockstate" as CFString,nil ,CFNotificationSuspensionBehavior.deliverImmediately)
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),nil ,exCb,"com.apple.springboard.lockcomplete" as CFString,nil ,CFNotificationSuspensionBehavior.deliverImmediately)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        //         If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        UIApplication.shared.beginBackgroundTask { [weak self] () -> Void in
            self?.observers.forEach { NotificationCenter.default.removeObserver($0, name: nil, object: nil) }
        }
        
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

