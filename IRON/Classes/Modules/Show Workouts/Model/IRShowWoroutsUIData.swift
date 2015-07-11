//
//  File.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit



struct IRUIWeekOverviewData{
    
    var weekTitle : String 
    var sectionNames : NSMutableOrderedSet
    var sectionData : [String:[Any]]
    
    
    
    
}


struct IRUIWeekOverviewSerie{
    
    var weight:CGFloat = 0
    var reps:Int = 0
    var flag:Constants.FlagType  = Constants.FlagType.Easy
    
    var index:Int
    var exercise:IRUIWeekOverviewExercise
    
   /* init(weight:CGFloat, reps:Int ,flag:Constants.FlagType){
        self.weight = weight
        self.reps = reps
        self.flag = flag
        
        
        
    }*/
    

}

struct IRUIWeekOverviewExercise{
    
    var exerciseName:String
    var exerciseAddedDate:NSDate


}
