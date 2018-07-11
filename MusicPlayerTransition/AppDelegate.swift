//
//  AppDelegate.swift
//  MusicPlayerTransition
//
//  Created by Jimmy Lee on 2018/7/11.
//  Copyright © 2018 Prime. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ListViewController()
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}
