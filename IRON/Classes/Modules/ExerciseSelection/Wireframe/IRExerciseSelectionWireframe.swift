//
//  IRExerciseSelectionWireframe.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation
import UIKit

let exerciseSelectionViewControllerIdentifier = "exerciseSelectionIdentifier"

protocol IRExerciseSelectionWireframeDismissDelegate : class {

    func  exerciseSelectionDismissedWithExerciseName(name:String, workoutDate:NSDate?)


}

class IRExerciseSelectionWireframe{


    var rootWireframe : RootWireframe?
    var addSeriesWireframe:IRAddSeriesWireframe?
    var exerciseSelectionViewController : IRExerciseSelectionViewController?
    var exerciseSelectionPresenter : IRExerciseSelectionPresenter?
    var exerciseSelectionInteractor: IRExerciseSelectionInteractor?
   
    weak var dismissDelegate : IRExerciseSelectionWireframeDismissDelegate?

    
    func presentListInterfaceFromWindow(window: UIWindow) {
        
      /*  exerciseSelectionViewController = exerciseSelectionViewControllerFromStoryboard()
        exerciseSelectionViewController!.eventHandler = exerciseSelectionPresenter
        exerciseSelectionPresenter!.userInterface = exerciseSelectionViewController
        rootWireframe!.showRootViewController(exerciseSelectionViewController!, inWindow: window)*/
    }
    
    /*func presentAddInterface() {
    addWireframe?.presentAddInterfaceFromViewController(listViewController!)
    }*/
    
    func exerciseSelectionViewControllerFromStoryboard(#initializationData:[String:AnyObject?] ) -> IRExerciseSelectionViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(exerciseSelectionViewControllerIdentifier) as! IRExerciseSelectionViewController
        viewController.eventHandler = exerciseSelectionPresenter
        exerciseSelectionPresenter!.userInterface = viewController
        exerciseSelectionPresenter!.initializationData = initializationData


        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    

    
    func exerciseSelected(exerciseName:String, withDate date:NSDate?) {
        
       
        //TODO BETTER without double reference wireframes
    
        //addSeriesWireframe!.presentAddSeriesInterfaceFromViewController(exerciseSelectionViewController! , withExerciseName:exerciseName)
        
        if let delegate = dismissDelegate {
        
            delegate.exerciseSelectionDismissedWithExerciseName(exerciseName,workoutDate: date)
        
        }
        
        //Dismiss exercise selection
        //TODO BEtter not sure if "-2" is currentVC
        if let navController = addSeriesWireframe!.addSeriesViewController!.navigationController {
        
            navController.viewControllers.removeAtIndex(navController.viewControllers.count-2)
            
        }
        
        
        
   
    }
    
    
    
    func presentExerciseSelectionInterfaceFromViewController(viewController: UIViewController, withDate:NSDate?) {
        
        var initializationData:[String:AnyObject?] = ["pickerDate":withDate]
        

        
        exerciseSelectionViewController = exerciseSelectionViewControllerFromStoryboard(initializationData: initializationData)
        
        
        let backItem = UIBarButtonItem(title:"", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = backItem
        exerciseSelectionViewController!.navigationItem.backBarButtonItem = backItem
        
        
        viewController.navigationController?.pushViewController(exerciseSelectionViewController!, animated: true)
        
        
    }

}