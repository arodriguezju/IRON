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
    
    
    }

}