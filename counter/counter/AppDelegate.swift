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
    var observers = [NSObjectProtocol]()
    var locking: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let observerSelf = UnsafeRawPointer(Unmanaged.passUnretained(self).toOpaque())


        let callback: @convention(c)
            (CFNotificationCenter?, UnsafeMutableRawPointer, CFString?, UnsafeRawPointer,        CFDictionary?) -> Void = {
                (center, observer, name, object, userInfo) in
                
                //Execute callback code
//                print(name)
//                let count = UserDefaults.standard.integer(forKey: "unlockCount")
//                print(count)
                
                
                let mySelf = Unmanaged<AppDelegate>.fromOpaque(observer).takeUnretainedValue()
                
                if(name! as String == "com.apple.springboard.lockcomplete"){
                    UserDefaults.standard.set(true, forKey: "Locking")
//                    print(mySelf.locking)
//                    mySelf.locking = true
                } else if(name! as String == "com.apple.springboard.lockstate"){
                    if(UserDefaults.standard.bool(forKey: "Locking")){
                        print("Locking")
                        UserDefaults.standard.set(false, forKey: "Locking")
                    } else {
                        print("Unlocking")
                    }
            }
                
                
        }
        
        let exCb: CFNotificationCallback = unsafeBitCast(callback, to: CFNotificationCallback.self)
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),nil ,exCb,"com.apple.springboard.lockstate" as CFString,nil ,CFNotificationSuspensionBehavior.deliverImmediately)
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),nil ,exCb,"com.apple.springboard.lockcomplete" as CFString,nil ,CFNotificationSuspensionBehavior.deliverImmediately)
        
        return true
    }
    
    func lockComplete(){
        if(self.locking){
            print("Locking")
            locking = false
        } else {
            print("Unlocking")
        }
    }
    
    func lockState(){
        self.locking = true
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

