//
//  IRShowWorkoutsInteractor.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation

class IRShowWorkoutsInteractor: NSObject, IRShowWorkoutsInteractorInput  {
    
    var output:IRShowWorkoutsInteractorOutput?
    var dataManager:IRShowWorkoutsDataManager
    
    
    init(dataManager:IRShowWorkoutsDataManager){
        
        self.dataManager = dataManager
        
    }
    
    
    
    
    
    func printWorkouts(workouts:[IRRawWorkout]){
    
    
        for workout in workouts {
        
            NSLog("Added \(workout.dateAdded) Exercise \(workout.exerciseName))")
            
            for serie in workout.series {
            
                NSLog("Flag \(serie.flag) Weight \(serie.weight) Reps \(serie.reps)")
            
            
            }
        
        
        }
    
    }
    
    
    func deleteSerie(atIndex index:Int, forExerciseAtDate date:NSDate,completion:(error:NSError?)-> Void){
    
        dataManager.deleteSerie(atIndex: index, forExerciseAtDate: date)
        
        if let workout = dataManager.getWorkoutAtAddedDate(date) {
            
            if workout.series.count == 0 {
            
                dataManager.deleteWorkoutAtAddedDate(date)
            
            }
        
        }
        
        //TODO
        completion(error:nil)
    
    }
    
    
    func findWorkouts(completion:(workouts:[IRRawWorkout])-> Void) {
    
        dataManager.getAllWorkouts({ rawItem in
            
           // self.printWorkouts(rawItem as [IRRawWorkout])
            
            completion(workouts: rawItem as [IRRawWorkout])
            
        })
    
    }


}
