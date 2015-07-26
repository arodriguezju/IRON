//
//  IRAddSeriesDataManager.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRAddSeriesDataManager: NSObject {
    
    var coreDataStore : IRCoreDataStore = IRCoreDataStore.sharedInstance
    
    //TODO Better -> Delete and use workoutdateadded to get currentworkout. 
    private var currentWorkout:IRRawWorkout?
    private var currentCDWorkout:IRWorkout?
   // private var currentCDSerie:IRSerie?
    
    
    func getNewWorkoutForExercise(exercise:String,completion:(IRRawWorkout)-> Void){
        
            
            var cdWorkout = coreDataStore.getNewWorkoutForExercise(exercise)
            var rawWorkout = coreDataToRawData(workout: cdWorkout)
        
            
            currentWorkout = rawWorkout
            currentCDWorkout = cdWorkout
        
            coreDataStore.save()
            completion(rawWorkout)
        
          //  coreDataStore.printAllSeries()
        
        
    
     }
    
    
    func getWorkoutAtDate(date:NSDate,completion:(IRRawWorkout)-> Void){
        
        var cdWorkout = coreDataStore.getWorkoutAtDate(date)
        
        
        if let cdWorkout = cdWorkout {
            
            var rawWorkout = coreDataToRawData(workout: cdWorkout)
            
                currentWorkout = rawWorkout
                currentCDWorkout = cdWorkout
            
            completion(rawWorkout)
        
        }
        
        
        
    }

    
    
    func coreDataToRawData(serie cdSerie:IRSerie)->IRRawSerie{
        
        
        let weightUnitsEnum = Constants.WeightUnits(rawValue: cdSerie.weightUnits)!
        let rawWeight = IRRawWeight(weight: CGFloat(cdSerie.weight.floatValue), weightUnit: weightUnitsEnum)
        
        
        var outputSerie = IRRawSerie(weight: rawWeight, reps: cdSerie.reps.integerValue, flag: Constants.FlagType(rawValue: cdSerie.flag.integerValue)!)
        
        return outputSerie
    }
    
    func coreDataToRawData(workout cdWorkout:IRWorkout)->IRRawWorkout{
        
        var outputWorkout = IRRawWorkout(dateAdded: cdWorkout.dateAdded,series:[],exerciseName:cdWorkout.exercise.exerciseName)
        
        for cdSerie in cdWorkout.series {
        
            var outputSerie = coreDataToRawData(serie:cdSerie as! IRSerie)
            outputWorkout.series.append(outputSerie)
            
         }
        
        return outputWorkout
    }
    
    
    func rawDataToCoreData(rawSerie:IRRawSerie, inCDSerie cdSerie:IRSerie)->IRSerie{
        
        
        cdSerie.weight = rawSerie.weight.weight
        cdSerie.weightUnits=rawSerie.weight.weightUnit.rawValue
        cdSerie.reps = rawSerie.reps
        cdSerie.flag = rawSerie.flag.rawValue
        
        return cdSerie
    }
    
    
    func  getNewSerieForCurrentWorkout (completion:(IRRawSerie)-> Void){
        
        
        var cdSerie = coreDataStore.getNewSerie()
        cdSerie.workout = currentCDWorkout!
        cdSerie.weightUnits = IRRawWeight.preferredUnitForUser.rawValue
        cdSerie.weight = 30
        cdSerie.reps = 5
        cdSerie.flag = Constants.FlagType.Easy.rawValue
        
        coreDataStore.save()

        let serie = coreDataToRawData(serie: cdSerie)
        
        currentWorkout?.series.append(serie)

        completion(serie)
        
    }
    
    func updateSerie(serie:IRRawSerie, atIndex index:Int, completion:()-> Void){
    
        if(currentWorkout!.series.count > index) {
            
            currentWorkout!.series[index]=serie
            
        }
        
        if (currentCDWorkout!.series.count > index){
        
            var serieCD = currentCDWorkout?.series[index] as! IRSerie
            
            serieCD.reps = serie.reps
            serieCD.weight = serie.weight.weight
            serieCD.weightUnits = serie.weight.weightUnit.rawValue
            serieCD.flag = serie.flag.rawValue
            
            coreDataStore.save()
        }
        
        completion()
        
    }
    
    

   
}
