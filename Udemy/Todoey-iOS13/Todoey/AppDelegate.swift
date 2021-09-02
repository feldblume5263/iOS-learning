//
//  AppDelegate.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // 우리의 앱이 로드 될 때. 처음으로 실행되는 곳이다.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    // 앱이 열리는 동안, device에 무슨일이 생겼을 경우 (앱이 열리는 중, 전화가 오는 등)
    func applicationWillResignActive(_ application: UIApplication) {

    }

    // home 버튼을 누르거나, 다른 앱으로 넘어가면 background로 들어간다.
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground")

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    // 앱이 종료될 때.
    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate")
    }


}

