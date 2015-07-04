//
//  IRShowWorkoutsDataManager.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRShowWorkoutsDataManager: NSObject {
    
    
    var coreDataStore : IRCoreDataStore = IRCoreDataStore.sharedInstance
    
    
    /*private var currentWorkout:IRRawWorkout?
    private var currentCDWorkout:IRWorkout?
    private var currentCDSerie:IRSerie?*/

    func getAllWorkouts(completion:([IRRawWorkout])-> Void){
        
        let coreDataWorkouts = coreDataStore.getAllWorkouts()
        
        completion(coreDataToRawData(coreDataWorkouts))
        
    }
    
    func coreDataToRawData(workouts:[IRWorkout])->[IRRawWorkout]{
    
        var output : [IRRawWorkout] = []
        for cdWorkout in workouts {
            
            let cdSeries = cdWorkout.series
            let rawSeries = coreDataToRawData(cdSeries)
            
            
            
            let rawWorkout = IRRawWorkout(dateAdded:cdWorkout.dateAdded,series:rawSeries,exerciseName:cdWorkout.exercise.exerciseName)
            
            output.append(rawWorkout)
        
        
        }
        
        return output
    
    }
    
    func coreDataToRawData(series:NSOrderedSet)->[IRRawSerie] {
    
        var output : [IRRawSerie] = []
        
        for cdSerie in series {
            
            let cdSerie = cdSerie as! IRSerie
            output.append(IRRawSerie(weight: CGFloat(cdSerie.weight.floatValue), reps: cdSerie.reps.integerValue, flag: Constants.FlagType(rawValue: cdSerie.flag.integerValue)!))
            
        
        
        }
    
        return output
    
    }

}
