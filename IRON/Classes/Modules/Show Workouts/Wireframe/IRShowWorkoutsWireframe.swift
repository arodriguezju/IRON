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
    
    var addSeriesWireframe: IRAddSeriesWireframe?
    
    
    
    var completionBlock: ((exerciseName:String, workoutDate:NSDate?) -> Void)?
    
    func presentListInterfaceFromWindow(window: UIWindow) {
        
        showWorkoutsViewController = showWorkoutsViewControllerFromStoryboard()
        showWorkoutsViewController!.eventHandler = showWorkoutsPresenter
        showWorkoutsPresenter!.userInterface = showWorkoutsViewController
        rootWireframe!.showRootViewController(showWorkoutsViewController!, inWindow: window)
    }
    
   
    
    
    
    func showWorkoutsViewControllerFromStoryboard() -> IRShowWorkoutsViewController {
        
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(showWorkoutsViewControllerIdentifier) as! IRShowWorkoutsViewController
        
        setUpLabelFontsForNavigationItem(viewController.navigationItem)
        return viewController
    }
    
    func setUpLabelFontsForNavigationItem(item:UINavigationItem) {
        
        if let leftItem =  item.leftBarButtonItem {
        
            leftItem.setTitleTextAttributes([
                NSFontAttributeName : Constants.Fonts.barItems!,
                NSForegroundColorAttributeName : Constants.Colors.barItems],
                forState: UIControlState.Normal)
        
        
        }   
    
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
    
    
  
    
    //New workout, dateAdded = nil
    func addButtonItemDidClik() {
        
        exerciseSelectionWireframe!.dismissDelegate = self
        exerciseSelectionWireframe!.presentExerciseSelectionInterfaceFromViewController(showWorkoutsViewController!,withDate:nil)
    
        completionBlock = {
            
            exerciseName, workoutDate in
            self.addSeriesWireframe!.presentAddSeriesInterfaceFromViewController(self.showWorkoutsViewController!, withWorkoutDate: NSDate(),andAddedDate:nil, andExerciseName: exerciseName)
       
        }
        
        
    }
    
    
    func workoutDidClick(workout:IRUIWeekOverviewExercise) {
        
        
        addSeriesWireframe!.presentAddSeriesInterfaceFromViewController(showWorkoutsViewController!, withWorkoutDate: workout.exerciseAddedDate,andAddedDate:workout.exerciseAddedDate, andExerciseName: workout.exerciseName)
        
        
    
    }
    
    
    func addButtonInSectionDidClick(date:NSDate) {
        
        let dateWithNowTime = date.getDateWithNowTime()
        
        exerciseSelectionWireframe!.dismissDelegate = self
        exerciseSelectionWireframe!.presentExerciseSelectionInterfaceFromViewController(showWorkoutsViewController!,withDate:dateWithNowTime)
        
        completionBlock = {
            exerciseName , workoutDate in
            
            if let date = workoutDate {
            
                self.addSeriesWireframe!.presentAddSeriesInterfaceFromViewController(self.showWorkoutsViewController!, withWorkoutDate: date,andAddedDate:nil, andExerciseName: exerciseName)
            
            }
            
        }
        
        
    
    }



}

extension IRShowWorkoutsWireframe:IRExerciseSelectionWireframeDismissDelegate {


    func  exerciseSelectionDismissedWithExerciseName(name:String,workoutDate date:NSDate?) {
        
    
        if let block = completionBlock {
        
            block(exerciseName: name,workoutDate:date)
            
            completionBlock=nil
        
        }

    
    }



}
