//
//  IRRawWorkoutData.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

struct IRRawWorkout{
   
    var dateAdded :NSDate = NSDate()
    
    var series : [IRRawSerie] = []
    var exerciseName: String
    
    
    

}





struct IRRawSerie{
    
     var weight:IRRawWeight
     var reps:Int
     var flag:Constants.FlagType
    
    init(weight:IRRawWeight, reps:Int,flag:Constants.FlagType){
        self.weight = weight
        self.reps = reps
        self.flag = flag
        
        
    }
    
   /*init(weight:CGFloat, reps:Int,flag:Constants.FlagType){
        
        let userDefaults=NSUserDefaults.standardUserDefaults()
        let weightUnits = userDefaults.stringForKey(Constants.UserDefaultsKeys.weightUnits.rawValue)!
        
        self.weight = weight
        self.reps = reps
        self.flag = flag
        self.weightUnits = Constants.WeightUnits(
        
    }*/

}

extension IRRawWorkout: Equatable {}

// MARK: Equatable

func ==(lhs: IRRawWorkout, rhs: IRRawWorkout) -> Bool {
    return lhs.dateAdded.compare(rhs.dateAdded) == NSComparisonResult.OrderedAscending
}