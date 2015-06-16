//
//  RootViewController.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation
import UIKit


class RootWireframe : NSObject {
    
    
    func showRootViewController(viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        var dummyVC = UIViewController.new()
               
        navigationController.viewControllers = [dummyVC]
        navigationController.pushViewController(viewController, animated: false)
    
    }
    
    func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
}