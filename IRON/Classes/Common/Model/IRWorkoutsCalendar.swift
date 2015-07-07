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
    
    func getModayDateString()->String{
        
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "ee"
        let dayOfDifferenceFromMonday = formatter.stringFromDate(self).toInt()!-1
        let mondayOfWeek = self.dateByAddingTimeInterval(NSTimeInterval(-dayOfDifferenceFromMonday*24*60*60))
        
         formatter.dateFormat = "dd.MM.yyyy"
        return formatter.stringFromDate(mondayOfWeek)
    
    }
    
    
    func getDayName()->String{
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.stringFromDate(self)
        
    }
    
    func getStringDateDifferenceFromToday(){
    
    
    }
   

}