//
//  AppDependencies.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class AppDependencies {
    
    //First vc
    //var addSeriesWireframe = IRAddSeriesWireframe()
    var showWorkoutsWireframe = IRShowWorkoutsWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        //addSeriesWireframe.presentListInterfaceFromWindow(window)
        
        showWorkoutsWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        
        var userDefaults=NSUserDefaults.standardUserDefaults()
        
        userDefaults.setObject(Constants.WeightUnits.Pounds.rawValue as NSString, forKey: Constants.UserDefaultsKeys.WeightUnits.rawValue)
        
        let rootWireframe = RootWireframe()
        
       /* let addSeriesPresenter = IRAddSeriesPresenter()
        let addSeriesDataManager = IRAddSeriesDataManager()
        let addSeriesInteractor = IRAddSeriesInteractor(dataManager:addSeriesDataManager)
        
        addSeriesInteractor.output = addSeriesPresenter

        addSeriesWireframe.rootWireframe = rootWireframe
        addSeriesWireframe.addSeriesPresenter = addSeriesPresenter
        addSeriesWireframe.addSeriesInteractor = addSeriesInteractor*/
        
        
        let showWorkoutsPresenter = IRShowWorkoutsPresenter()
        let showWorkoutsDataManager = IRShowWorkoutsDataManager()
        let showWorkoutsInteractor = IRShowWorkoutsInteractor(dataManager:showWorkoutsDataManager)
        
        
        
        showWorkoutsWireframe.rootWireframe = rootWireframe
        showWorkoutsWireframe.showWorkoutsPresenter = showWorkoutsPresenter
        showWorkoutsWireframe.showWorkoutsInteractor = showWorkoutsInteractor
        
        showWorkoutsInteractor.output = showWorkoutsPresenter
        showWorkoutsPresenter.showWorkoutsInteractor = showWorkoutsInteractor
        showWorkoutsPresenter.showWorkoutsWireframe =  showWorkoutsWireframe
        
        
        
        
        
        
        let exerciseSelectionWireframe = IRExerciseSelectionWireframe()
        let exerciseSelectionPresenter = IRExerciseSelectionPresenter()
        let exerciseSelectionDataManager = IRExerciseSelectionDataManager()
        let exerciseSelectionInteractor = IRExerciseSelectionInteractor(dataManager:exerciseSelectionDataManager)
        

        
        exerciseSelectionWireframe.rootWireframe = rootWireframe
        exerciseSelectionWireframe.exerciseSelectionPresenter = exerciseSelectionPresenter
        exerciseSelectionWireframe.exerciseSelectionInteractor = exerciseSelectionInteractor
        
        exerciseSelectionInteractor.output = exerciseSelectionPresenter
        exerciseSelectionPresenter.exerciseSelectionInteractor = exerciseSelectionInteractor
        exerciseSelectionPresenter.exerciseSelectionWireframe =  exerciseSelectionWireframe
        
        showWorkoutsWireframe.exerciseSelectionWireframe = exerciseSelectionWireframe

        
        let addSeriesWireframe = IRAddSeriesWireframe()
        let addSeriesPresenter = IRAddSeriesPresenter()
        let addSeriesDataManager = IRAddSeriesDataManager()
        let addSeriesInteractor = IRAddSeriesInteractor(dataManager:addSeriesDataManager)
        
        addSeriesInteractor.output = addSeriesPresenter
        addSeriesWireframe.addSeriesPresenter = addSeriesPresenter
        addSeriesWireframe.addSeriesInteractor = addSeriesInteractor
        addSeriesPresenter.addSeriesInteractor = addSeriesInteractor
        addSeriesInteractor.output = addSeriesPresenter
        
        exerciseSelectionWireframe.addSeriesWireframe  = addSeriesWireframe
        
        showWorkoutsWireframe.addSeriesWireframe = addSeriesWireframe
        
    
    }
   
}
