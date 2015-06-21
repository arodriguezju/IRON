//
//  IRShowWorkoutsPresenter.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation

class IRShowWorkoutsPresenter: NSObject , IRShowWorkoutsEventHandler, IRShowWorkoutsInteractorOutput  {
    
    var userInterface:IRShowWorkoutsUIInterface?
    var showWorkoutsInteractor : IRShowWorkoutsInteractorInput?
    var showWorkoutsWireframe: IRShowWorkoutsWireframe?
    
    
    
    func UIDidLoad(){
    
        showWorkoutsInteractor?.findWorkouts()
        
        
        let sectionNames = ["Dienstag","Mittwoch","Freitag"]
        
        var sectionData:[Int:[Any]]=[:]
        var exercisesNames:[Any]=[]
        exercisesNames.append(IRUIWeekOverviewExercise(exerciseName:"BenchPress"))
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))

        exercisesNames.append(IRUIWeekOverviewExercise(exerciseName:"Front Squats"))
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))
        
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 40, reps: 5, flag: Constants.FlagType.Easy))
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))
        
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Normal))
        
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Hard))
        sectionData[0]=exercisesNames
        exercisesNames.append(IRUIWeekOverviewExercise(exerciseName:"Back Squats"))
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))

        sectionData[1]=exercisesNames
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))

        exercisesNames.append(IRUIWeekOverviewSerie(weight: 40, reps: 5, flag: Constants.FlagType.Easy))
        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))

        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))

        exercisesNames.append(IRUIWeekOverviewSerie(weight: 10, reps: 10, flag: Constants.FlagType.Easy))


 
        sectionData[2]=exercisesNames


        
        
        var data = IRUIWeekOverviewData(weekTitle:"",sectionNames:sectionNames,sectionData:sectionData)
        
        

        
       userInterface!.displayWeekData(data)
        
    
    }
    
    func foundWorkouts(){
    
    
    
    }
    
    func addButtonItemDidClick() {
    
        showWorkoutsWireframe!.addButtonItemDidClik()
    
    }

}
