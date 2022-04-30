//
//  UIWindow+Extensions.swift
//  
//
//  Created by Maxime Maheo on 25/04/2022.
//

import UIKit.UIWindow

public extension UIWindow {
    func updateRootViewController(with viewController: UIViewController) {
        UIView.transition(with: self,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: { [weak self ] in self?.rootViewController = viewController },
                          completion: nil)
    }
}
