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
    var weekUTCDate :NSDate
    var sectionNames : NSMutableOrderedSet
    var sectionData :[String:[Any]]
    var sectionUTCDates:[String:NSDate]
    
    
    mutating func addAllDaysOfTheWeek(#untilToday:Bool){
        
        var currentDate = weekUTCDate
        
        for i in 1...7 {
            
            let currentDay = currentDate.getLocalDayName()
            
            sectionNames.addObject(currentDay)
            sectionUTCDates[currentDay]=currentDate

            
            if (sectionData[currentDay]==nil) {
                sectionData[currentDay]=[]
            }
            
            currentDate = weekUTCDate.addDaysToDate(i)
            
            
            if (untilToday){
                let today = NSDate()
                if (currentDate.compare(NSDate())==NSComparisonResult.OrderedDescending) {
                    break
                }
            }
        }
        
        
    }  
    
    
}


struct IRUIWeekOverviewSerie{
    
    var weight:CGFloat
    var weightUnit:Constants.WeightUnits
    var reps:Int
    var flag:Constants.FlagType 
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
    var exerciseDate:NSDate



}



