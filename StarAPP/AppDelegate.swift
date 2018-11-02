//
//  AppDelegate.swift
//  StarAPP
//
//  Created by 橘子Star on 2018/4/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window?.backgroundColor = UIColor.white
        
        self.window?.rootViewController = MyTabBar.MyTabBar()
        
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
    /*
     总结：自定义Log：
     v定义Log 1. 定义Log的打印内容
     打印所在的 件 #FILE 打印所在的方法 #FUNCTION 打印所在的行 #LINE
     默认参数：当在方法中传参数时，也可以传入默认参数，定义：file : String = #file
     全局函数：在AppDelegate中定义全局函数：泛型传打印内容：func XMGLog<T>(_ messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line)
     2.Log在Debug下 打印,在release下 不打印
     定义标记项 —>buildSettings—>搜索swift flag—>Debug -> -D DEBUG 做标记--------在项目中实现：#if DEBUG    #endif
     
     */
    
    func XMGLog<T>(_ messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
        
        #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum))-\(messsage)")
        
        #endif
    }

}

