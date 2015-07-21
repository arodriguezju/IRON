//
//  WorkoutsCalendar.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 07/07/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

extension NSDate {



    
    func getWeekName()->String{
            
        var formatter = NSDateFormatter()
        formatter.dateFormat = "w"
        let weekNr=formatter.stringFromDate(self)
        return formatter.stringFromDate(self)
    
    }
    
    func getFirstDayOfWeekDateString()->String{
        
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.stringFromDate(getFirstDayOfWeekDate())
    
    }
    
    
    func getFirstDayOfWeekDate()->NSDate {
    
        var formatter = NSDateFormatter()
        formatter.dateFormat = "ee"
        let dayOfDifferenceFromFirstDayOfWeek = formatter.stringFromDate(self).toInt()!-1
        let firstDayOfWeek = self.dateByAddingTimeInterval(NSTimeInterval(-dayOfDifferenceFromFirstDayOfWeek*24*60*60))

        return firstDayOfWeek
    
    }
    
    
    func getDayName()->String{
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.stringFromDate(self)
        
    }
    
    func getStringDateDifferenceFromToday(){
    
    
    }
   

}