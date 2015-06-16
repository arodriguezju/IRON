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
    var exerciseSelectionWireframe = IRExerciseSelectionWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        //addSeriesWireframe.presentListInterfaceFromWindow(window)
        
        exerciseSelectionWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
    
        let rootWireframe = RootWireframe()
        
       /* let addSeriesPresenter = IRAddSeriesPresenter()
        let addSeriesDataManager = IRAddSeriesDataManager()
        let addSeriesInteractor = IRAddSeriesInteractor(dataManager:addSeriesDataManager)
        
        addSeriesInteractor.output = addSeriesPresenter

        addSeriesWireframe.rootWireframe = rootWireframe
        addSeriesWireframe.addSeriesPresenter = addSeriesPresenter
        addSeriesWireframe.addSeriesInteractor = addSeriesInteractor*/
        
        
        let exerciseSelectionPresenter = IRExerciseSelectionPresenter()
        let exerciseSelectionDataManager = IRExerciseSelectionDataManager()
        let exerciseSelectionInteractor = IRExerciseSelectionInteractor(dataManager:exerciseSelectionDataManager)
        
        
        
        exerciseSelectionWireframe.rootWireframe = rootWireframe
        exerciseSelectionWireframe.exerciseSelectionPresenter = exerciseSelectionPresenter
        exerciseSelectionWireframe.exerciseSelectionInteractor = exerciseSelectionInteractor
        
        exerciseSelectionInteractor.output = exerciseSelectionPresenter
        exerciseSelectionPresenter.exerciseSelectionInteractor = exerciseSelectionInteractor
        exerciseSelectionPresenter.exerciseSelectionWireframe =  exerciseSelectionWireframe

        
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
        
    
    }
   
}
