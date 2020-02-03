//
//  AppDelegate.swift
//  RavingViewDemo
//
//  Created by Ravindra Sonkar on 31/01/20.
//  Copyright © 2020 Ravindra Sonkar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


   
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let wind = UIWindow(frame: UIScreen.main.bounds)
        window = wind
        setHomeAsRootViewController(window: window)
        return true
    }
    func setHomeAsRootViewController(window: UIWindow?) {
        if let objLandingViewC = UIStoryboard(name: "Main", bundle: nil ).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            let objNav = UINavigationController(rootViewController: objLandingViewC)
            objNav.isNavigationBarHidden = true
            window?.rootViewController = objNav
        }
    }
}

