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


class IRExerciseSelectionWireframe{


    var rootWireframe : RootWireframe?
    var addSeriesWireframe:IRAddSeriesWireframe?
    var exerciseSelectionViewController : IRExerciseSelectionViewController?
    var exerciseSelectionPresenter : IRExerciseSelectionPresenter?
    var exerciseSelectionInteractor: IRExerciseSelectionInteractor?
   


    
    func presentListInterfaceFromWindow(window: UIWindow) {
        
        exerciseSelectionViewController = exerciseSelectionViewControllerFromStoryboard()
        exerciseSelectionViewController!.eventHandler = exerciseSelectionPresenter
        exerciseSelectionPresenter!.userInterface = exerciseSelectionViewController
        rootWireframe!.showRootViewController(exerciseSelectionViewController!, inWindow: window)
    }
    
    /*func presentAddInterface() {
    addWireframe?.presentAddInterfaceFromViewController(listViewController!)
    }*/
    
    func exerciseSelectionViewControllerFromStoryboard() -> IRExerciseSelectionViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(exerciseSelectionViewControllerIdentifier) as! IRExerciseSelectionViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    

    
    func exerciseSelected(exerciseName:String) {
        
       
        
    
        addSeriesWireframe!.presentAddSeriesInterfaceFromViewController(exerciseSelectionViewController!)
        
        
        //Dismiss exercise selection
        if let navController = addSeriesWireframe!.addSeriesViewController!.navigationController {
        
            navController.viewControllers.removeAtIndex(navController.viewControllers.count-2)
            
        }
        
        
        
   
    }
    
    func presentExerciseSelectionInterfaceFromViewController(viewController: UIViewController) {
        
        let newViewController = exerciseSelectionViewControllerFromStoryboard()
        exerciseSelectionViewController = newViewController
        var navigationController = viewController.navigationController
        
        newViewController.eventHandler = exerciseSelectionPresenter
         exerciseSelectionPresenter!.userInterface=newViewController
        //navigationController?.popViewControllerAnimated(false)
        navigationController?.pushViewController(newViewController, animated: true)
        //navigationController?.viewControllers.removeAtIndex(navigationController!.viewControllers.count-2)
        
        
    }

}