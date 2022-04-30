//
//  AppDelegate.swift
//  WeBudget
//
//  Created by Maxime Maheo on 30/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    var window: UIWindow?
    
    private var coordinator: AppCoordinator?

    // MARK: - Methods
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window = window else { fatalError("Could not create window") }
        
        coordinator = AppCoordinator(window: window,
                                     launchOptions: launchOptions)
        coordinator?.start()
        
        return true
    }
}
