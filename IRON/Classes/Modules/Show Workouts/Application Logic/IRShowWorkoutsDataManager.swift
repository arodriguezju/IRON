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
        
       //coreDataStore.createDummyWorkouts()
        
        var coreDataWorkouts = coreDataStore.getAllWorkouts()
        coreDataWorkouts.sort({
        
            (s1 : IRWorkout, s2 : IRWorkout) -> Bool in
            return s1.dateWorkout.compare(s2.dateWorkout) == NSComparisonResult.OrderedAscending
        })
        
        completion(coreDataToRawData(coreDataWorkouts))
        
    }
    
    func coreDataToRawData(workouts:[IRWorkout])->[IRRawWorkout]{
    
        var output : [IRRawWorkout] = []
        for cdWorkout in workouts {
            
    
            let rawWorkout = coreDataToRawData(cdWorkout)
            
            output.append(rawWorkout)
        
        
        }
        
        return output
    
    }
    
    
    func coreDataToRawData(cdWorkout:IRWorkout)-> IRRawWorkout {
    
        let cdSeries = cdWorkout.series
        let rawSeries = coreDataToRawData(cdSeries)
        
        
        let rawWorkout = IRRawWorkout(dateAdded:cdWorkout.dateAdded,dateWorkout:cdWorkout.dateWorkout,series:rawSeries,exerciseName:cdWorkout.exercise.exerciseName)
    
        return rawWorkout
    }
    
    func coreDataToRawData(series:NSOrderedSet)->[IRRawSerie] {
    
        var output : [IRRawSerie] = []
        
        for cdSerie in series {
            
            let cdSerie = cdSerie as! IRSerie
           
            
            let rawWeight = IRRawWeight(weight: CGFloat(cdSerie.weight.floatValue), weightUnit: Constants.WeightUnits(rawValue: cdSerie.weightUnits)!)
            output.append(IRRawSerie(weight: rawWeight, reps: cdSerie.reps.integerValue, flag: Constants.FlagType(rawValue: cdSerie.flag.integerValue)!))
            
        
        }
    
        return output
    
    }
    
    
    func deleteSerie(atIndex index:Int, forExerciseAtDate date:NSDate) {
    
        var cdWorkout = coreDataStore.getWorkoutAtAddedDate(date)
        
        
        if let cdWorkout = cdWorkout {
        
            if cdWorkout.series.count > index {
                
                let serie = cdWorkout.series.objectAtIndex(index) as! IRSerie
                coreDataStore.deleteSerie(serie)
                               
            }
            
        
        }
    
    }
    
    func deleteWorkoutAtAddedDate(date:NSDate){
        
        
        if let cdWorkout = coreDataStore.getWorkoutAtAddedDate(date) {
            
            coreDataStore.deleteWorkout(cdWorkout)
        
        }
    
    }
    
    func getWorkoutAtAddedDate(date:NSDate)->IRRawWorkout?{
    
        if let cdWorkout = coreDataStore.getWorkoutAtAddedDate(date) {
            
            return coreDataToRawData(cdWorkout)
        }
        
        return nil
        
    }

}
