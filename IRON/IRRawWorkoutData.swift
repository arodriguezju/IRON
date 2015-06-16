//
//  IRRawWorkoutData.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

struct IRRawWorkout{
   
    var date :NSDate = NSDate()
    
    var series : [IRRawSerie] = []
    
    
    

}


struct IRRawSerie{
    
    var weight:CGFloat = 0
    var reps:Int = 0
     var flag:Constants.FlagType  = Constants.FlagType.Easy
    
    init(weight:CGFloat, reps:Int ,flag:Constants.FlagType){
        self.weight = weight
        self.reps = reps
        self.flag = flag
        
        
    }

}