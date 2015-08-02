//
//  IRUIWorkoutData.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

struct IRUIWorkout{
    
    var dateWorkout :NSDate = NSDate()
    
    var series : [IRUISerie] = []
    
    var exerciseName : String=""
    
    
    
}


struct IRUISerie{
    
    var weight:CGFloat = 0
    var weightUnit:Constants.WeightUnits
    var reps:Int = 0
     var flag:Constants.FlagType  = Constants.FlagType.Easy
    
    init(weight:CGFloat,weightUnit:Constants.WeightUnits, reps:Int ,flag:Constants.FlagType){
        self.weight = weight
        self.reps = reps
        self.flag = flag
        self.weightUnit = weightUnit
    }
    
}
