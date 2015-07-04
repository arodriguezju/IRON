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
        
      //  showWorkoutsInteractor!.findWorkouts()
        
        
    }
    
    func UIDidAppear(){
        
        showWorkoutsInteractor!.findWorkouts()
        
        
    }
    
    
    func foundWorkouts(workouts:[IRRawWorkout]){
        
        
        userInterface!.displayWeeklyData(prepareRawDataForUI(workouts))
        userInterface!.scrollToFirstWeek()
        
        
    }
    
    
    func prepareRawDataForUI(workouts:[IRRawWorkout])->[IRUIWeekOverviewData] {
        
        
        
        var dataByWeek :[String:IRUIWeekOverviewData] = [:]
        
        
        
        var weeks : [String:IRUIWeekOverviewData] = [:]
        for workout in workouts {
            
            var formatter = NSDateFormatter()
            formatter.dateFormat = "w"

            let weekName = formatter.stringFromDate(workout.dateAdded)
            formatter.dateFormat = "EEEE"
            let dayName = formatter.stringFromDate(workout.dateAdded)
            
            if ( weeks[weekName] == nil ) {
                
                weeks[weekName] = IRUIWeekOverviewData(weekTitle:weekName,sectionNames:[],sectionData:[:])
                
            }
            
            if ( weeks[weekName]!.sectionData[dayName] == nil ) {
                
                weeks[weekName]!.sectionData[dayName] = []
                
            }
            
            weeks[weekName]!.sectionNames.addObject(dayName)
            
            weeks[weekName]!.sectionData[dayName]!.append(IRUIWeekOverviewExercise(exerciseName:workout.exerciseName))
            
            
            for serie in workout.series {
                
                weeks[weekName]!.sectionData[dayName]!.append(IRUIWeekOverviewSerie(weight:serie.weight, reps: serie.reps, flag: serie.flag))
                
            }
            
            
            
            
        }
        
        return weeks.values.array
        
    }
    
    func addButtonItemDidClick() {
        
        showWorkoutsWireframe!.addButtonItemDidClik()
        
    }
    
}
