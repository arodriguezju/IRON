//
//  AddSeriesInteractor.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRAddSeriesInteractor:  IRAddSeriesInteractorInput {
    
    var dataManager : IRAddSeriesDataManager
    var output:IRAddSeriesInteractorOutput?
    
    
    init(dataManager:IRAddSeriesDataManager){
        self.dataManager = dataManager
    
    }
    
   /* func findNewWorkoutWithExerciseName(name:String){
        
      
        dataManager.getNewWorkoutForExercise(name, completion: { rawItem in
            self.output!.foundWorkout(rawItem as IRRawWorkout)
        })
        
        
    }*/
    
    
    func findNewWorkout(#exerciseName:String, workoutDate:NSDate) {
    
        dataManager.getNewWorkout(exerciseName:exerciseName, workoutDate:workoutDate, completion: { rawItem in
            self.output!.foundWorkout(rawItem as IRRawWorkout)
        })
    
    
    
    }
    
    func findWorkoutWithDate(date:NSDate) {
    
        dataManager.getWorkoutAtAddedDate(date, completion: { rawItem in
            self.output!.foundWorkout(rawItem as IRRawWorkout?)
        })
        
    
    }
    
    func getWeightSteps(forWeightUnits:Constants.WeightUnits)->CGFloat{
        
        
        switch forWeightUnits {
        
            case .Kilograms: return Constants.WeightSteps.DefaultValue.rawValue
            
            case .Pounds: return Constants.WeightSteps.DefaultValue.rawValue
            
        
        default: return 0
        }
    
}
    
    
    
   func getRepSteps()->Int{
    
        return 1    
    }
    
    func findNewSerie(){
        
        dataManager.getNewSerieForCurrentWorkout({ rawItem in
            self.output!.foundNewSerie(rawItem as IRRawSerie)
        })

        
    }
    func updateSerieForCurrentWorkout(weight:CGFloat,reps:Int, flag:Constants.FlagType, atIndex index:Int) {
        
        let rawWeight = IRRawWeight(weight: weight, weightUnit: IRRawWeight.preferredUnitForUser)
        
        let rawSerie = IRRawSerie(weight: rawWeight, reps: reps, flag: flag)
        
        updateSerie(rawSerie, atIndex: index)
    
    
    }

    
    private func updateSerie(serie:IRRawSerie, atIndex index:Int){
        
        dataManager.updateSerie(serie, atIndex: index, completion: ({}))
        
    
    }
   
}
