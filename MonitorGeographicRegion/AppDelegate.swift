//
//  AppDelegate.swift
//  MonitorGeographicRegion
//
//  Created by osu on 2018/04/22.
//  Copyright © 2018 osu. All rights reserved.
//

import UIKit
import CocoaLumberjack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        initLogger()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        DDLogVerbose("applicationWillResignActive")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        DDLogVerbose("applicationDidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        DDLogVerbose("applicationWillEnterForeground")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        DDLogVerbose("applicationDidBecomeActive")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        DDLogVerbose("applicationWillTerminate")
    }
    
    func initLogger() {
        DDLog.add(DDTTYLogger.sharedInstance) // TTY = Xcode console
        DDLog.add(DDASLLogger.sharedInstance) // ASL = Apple System Logs
        
        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = TimeInterval(60*60*24)  // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
    }
    
}
