//
//  IRShowWorkoutsWireframe.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation
import UIKit

let showWorkoutsViewControllerIdentifier = "showWorkoutsIdentifier"

class IRShowWorkoutsWireframe: NSObject {
    
    
    
    
    
    
    var rootWireframe : RootWireframe?
    var exerciseSelectionWireframe:IRExerciseSelectionWireframe?
    var showWorkoutsViewController : IRShowWorkoutsViewController?
    var showWorkoutsPresenter : IRShowWorkoutsPresenter?
    var showWorkoutsInteractor: IRShowWorkoutsInteractor?
    
    
    
    
    func presentListInterfaceFromWindow(window: UIWindow) {
        
        showWorkoutsViewController = showWorkoutsViewControllerFromStoryboard()
       showWorkoutsViewController!.eventHandler = showWorkoutsPresenter
        showWorkoutsPresenter!.userInterface = showWorkoutsViewController
        rootWireframe!.showRootViewController(showWorkoutsViewController!, inWindow: window)
    }
    
    /*func presentAddInterface() {
    addWireframe?.presentAddInterfaceFromViewController(listViewController!)
    }*/
    
    
    
    func showWorkoutsViewControllerFromStoryboard() -> IRShowWorkoutsViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(showWorkoutsViewControllerIdentifier) as! IRShowWorkoutsViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
    
    
   /* func exerciseSelected(exerciseName:String) {
        
        addSeriesWireframe!.presentAddSeriesInterfaceFromViewController(exerciseSelectionViewController!)
        
        
        
    }*/


}
