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
    
    func findNewWorkout(){
        
        //ToDo other workout
        dataManager.getNewWorkout( { rawItem in
            self.output!.foundNewWorkout(rawItem as IRRawWorkout)
        })
        
        
    }
    
    
    
    
    func getWeightSteps(forWeightUnits:Constants.WeightUnits)->CGFloat{
    
        if(forWeightUnits == Constants.WeightUnits.Kilograms) { return 1 }
        
        if(forWeightUnits == Constants.WeightUnits.Pounds) { return 2 }

        return 0
    }
    
    
    
    func getRepSteps()->Int{
    
    
        return 1
    
    }
    
    func findNewSerie(){
        
        dataManager.getNewSerieForCurrentWorkout({ rawItem in
            self.output!.foundNewSerie(rawItem as IRRawSerie)
        })

        
    }
    
    
    func updateSerie(serie:IRRawSerie, atIndex index:Int){
        
        dataManager.updateSerie(serie, atIndex: index, completion: ({}))
        
    
    }
   
}
