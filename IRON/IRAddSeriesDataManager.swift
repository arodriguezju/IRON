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
    
    
    private var currentWorkout:IRRawWorkout?
    private var currentCDWorkout:IRWorkout?
    private var currentCDSerie:IRSerie?
    
    
    func getNewWorkout(completion:(IRRawWorkout)-> Void){
        
            var newWorkout = IRRawWorkout()
        
            var cdWorkout = coreDataStore.getNewWorkout()
                cdWorkout.idWorkout = "id Test"
            var cdSerie = coreDataStore.getNewSerie()
                cdSerie.workout = cdWorkout
                cdSerie.weight = 30
                cdSerie.reps = 5
                cdSerie.flag = Constants.FlagType.Easy.rawValue
        
        
            
            newWorkout.series.append(coreDataToRawData(cdSerie))
        
            
            currentWorkout = newWorkout
            currentCDWorkout = cdWorkout
            currentCDSerie = cdSerie
        
            coreDataStore.save()
            completion(newWorkout)

        
        
            coreDataStore.printAllSeries()
        
        
    
     }
    
    
    
    func coreDataToRawData(cdSerie:IRSerie)->IRRawSerie{
        var outputSerie = IRRawSerie(weight: CGFloat(cdSerie.weight.floatValue), reps: cdSerie.reps.integerValue, flag: Constants.FlagType(rawValue: cdSerie.flag.integerValue)!)
        
        return outputSerie
    }
    
    
    func rawDataToCoreData(rawSerie:IRRawSerie, inCDSerie cdSerie:IRSerie)->IRSerie{
        
        
        cdSerie.weight = rawSerie.weight
        cdSerie.reps = rawSerie.reps
        cdSerie.flag = rawSerie.flag.rawValue
        
        return cdSerie
    }
    
    
    func  getNewSerieForCurrentWorkout (completion:(IRRawSerie)-> Void){
        
        
        var cdSerie = coreDataStore.getNewSerie()
        cdSerie.workout = currentCDWorkout!
        cdSerie.weight = 30
        cdSerie.reps = 5
        cdSerie.flag = Constants.FlagType.Easy.rawValue
        
        coreDataStore.save()

        let serie = coreDataToRawData(cdSerie)
        
        currentWorkout?.series.append(serie)

        completion(serie)
        
    }
    
    func updateSerie(serie:IRRawSerie, atIndex index:Int, completion:()-> Void){
    
        if( currentWorkout!.series.count > index) {
            
            currentWorkout!.series[index]=serie
            
        }
        
        if (currentCDWorkout!.series.count > index){
        
            var serieCD = currentCDWorkout?.series.allObjects[index] as! IRSerie
            
            serieCD.reps = serie.reps
            
            coreDataStore.save()
        }
        
        completion()
        
    }
    
    

   
}
