//
//  AddSerieWireframe.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation
import UIKit


let viewControllerIdentifier = "addSeriesIdentifier"


class IRAddSeriesWireframe{

    
    var rootWireframe : RootWireframe?
    var addSeriesViewController : IRAddSeriesViewController?
    var addSeriesPresenter : IRAddSeriesPresenter?
    var addSeriesInteractor: IRAddSeriesInteractor?


    func presentListInterfaceFromWindow(window: UIWindow) {
        addSeriesViewController = addSeriesViewControllerFromStoryboard()
        addSeriesViewController!.eventHandler = addSeriesPresenter
        addSeriesPresenter!.userInterface = addSeriesViewController
        
        addSeriesPresenter!.addSeriesInteractor = addSeriesInteractor
        rootWireframe!.showRootViewController(addSeriesViewController!, inWindow: window)
    }
    
    /*func presentAddInterface() {
        addWireframe?.presentAddInterfaceFromViewController(listViewController!)
    }*/
    
    func addSeriesViewControllerFromStoryboard() -> IRAddSeriesViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(viewControllerIdentifier) as! IRAddSeriesViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
    func presentAddSeriesInterfaceFromViewController(viewController: UIViewController, withExerciseName exerciseName:String) {
        
        let newViewController = addSeriesViewControllerFromStoryboard()
        var navigationController = viewController.navigationController
        addSeriesViewController = newViewController
        newViewController.eventHandler = addSeriesPresenter
        newViewController.currentExercise = exerciseName
        addSeriesPresenter!.userInterface=newViewController
        //navigationController?.popViewControllerAnimated(false)
        navigationController?.pushViewController(newViewController, animated: true)
        //navigationController?.viewControllers.removeAtIndex(navigationController!.viewControllers.count-2)
       
        
    }

}
