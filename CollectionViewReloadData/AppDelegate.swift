//
//  AppDelegate.swift
//  CollectionViewReloadData
//
//  Created by Jonathan Baker on 8/24/17.
//  Copyright © 2017 HODINKEE Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?


    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.rootViewController = UINavigationController(rootViewController: MyCollectionViewController())
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
