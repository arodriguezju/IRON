//
//  AddSeriesInteractorIO.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

protocol IRAddSeriesInteractorInput{

    
    
   // func addWeightToSerieAtIndex(index:Int)
    func findNewSerie() //Reply foundNewSerie
    
    
    //Data requests from UI
    func findNewWorkout() //Reply foundCurrentWorkout
    func getWeightSteps(forWeightUnits:Constants.WeightUnits)->CGFloat
    func getRepSteps()->Int

    
    //Events from UI
    func updateSerie(serie:IRRawSerie, atIndex index:Int)

}

protocol IRAddSeriesInteractorOutput{

    
    func foundNewWorkout(workout:IRRawWorkout)
    func foundNewSerie(serie:IRRawSerie)
    
    

}
