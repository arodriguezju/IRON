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
    func findNewWorkoutWithExerciseName(name:String) //Reply foundWorkout
    
    func findWorkoutWithDateAdded(date:NSDate) //Reply foundWorkout

    func getWeightSteps(forWeightUnits:Constants.WeightUnits)->CGFloat
    func getRepSteps()->Int

    
    //Events from UI
    func updateSerieForCurrentWorkout(weight:CGFloat,reps:Int, flag:Constants.FlagType, atIndex index:Int)

}

protocol IRAddSeriesInteractorOutput{

    
    func foundWorkout(workout:IRRawWorkout)
    func foundNewSerie(serie:IRRawSerie)
    
    

}
