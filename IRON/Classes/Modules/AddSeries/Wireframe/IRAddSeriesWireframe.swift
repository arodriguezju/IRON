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
       /* addSeriesViewController = addSeriesViewControllerFromStoryboard(initializationData: <#[String : AnyObject?]#>))
        addSeriesViewController!.eventHandler = addSeriesPresenter
        addSeriesPresenter!.userInterface = addSeriesViewController
        
        addSeriesPresenter!.addSeriesInteractor = addSeriesInteractor
        rootWireframe!.showRootViewController(addSeriesViewController!, inWindow: window)*/
    }
    
    /*func presentAddInterface() {
        addWireframe?.presentAddInterfaceFromViewController(listViewController!)
    }*/
    
    func addSeriesViewControllerFromStoryboard(#initializationData: [String:AnyObject?]) -> IRAddSeriesViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(viewControllerIdentifier) as! IRAddSeriesViewController
        viewController.initializationData = initializationData
        viewController.eventHandler = addSeriesPresenter

        addSeriesPresenter!.userInterface=viewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
  
    
    
    //For new workouts addedDate=nil
    func presentAddSeriesInterfaceFromViewController(viewController: UIViewController, withWorkoutDate workoutDate:NSDate, andAddedDate addedDate:NSDate?, andExerciseName exerciseName:String) {
        
        var initializationData:[String:AnyObject?] = ["workoutDate":workoutDate,"workoutAddedDate":addedDate,"exerciseName":exerciseName]
        
        
        addSeriesViewController = addSeriesViewControllerFromStoryboard(initializationData: initializationData)
        addSeriesViewController!.navigationItem.title=exerciseName
        
        let backItem = UIBarButtonItem(title:"", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = backItem

        viewController.navigationController?.pushViewController(addSeriesViewController!, animated: true)
        
        
    }

}
