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
    
    
   /* func findWorkouts(){
        
        dataManager.getAllWorkouts({ rawItem in
            self.printWorkouts(rawItem as [IRRawWorkout])
            
           // self.output!.foundWorkouts(rawItem as [IRRawWorkout])
        
        })

        
    
    }*/
    
    func printWorkouts(workouts:[IRRawWorkout]){
    
    
        for workout in workouts {
        
            NSLog("Added \(workout.dateAdded) Exercise \(workout.exerciseName))")
            
            for serie in workout.series {
            
                NSLog("Flag \(serie.flag) Weight \(serie.weight) Reps \(serie.reps)")
            
            
            }
        
        
        }
    
    }
    
    
    func deleteSerie(atIndex index:Int, forExerciseAtDate date:NSDate){
    
        dataManager.deleteSerie(atIndex: index, forExerciseAtDate: date)
    
    }
    
    
    func findWorkouts(completion:(workouts:[IRRawWorkout])-> Void) {
    
        dataManager.getAllWorkouts({ rawItem in
            
            self.printWorkouts(rawItem as [IRRawWorkout])
            
            completion(workouts: rawItem as [IRRawWorkout])
            
        })
    
    }


}
