//
//  IRShowWorkoutsInteractorIO.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation



protocol IRShowWorkoutsInteractorInput {
    
    //func findWorkouts()

    func deleteSerie(atIndex index:Int, forExerciseAtDate date:NSDate)
    
    
    func findWorkouts(completion:(workouts:[IRRawWorkout])-> Void)

}

protocol IRShowWorkoutsInteractorOutput {
    
    //func foundWorkouts(workouts:[IRRawWorkout])
    
}