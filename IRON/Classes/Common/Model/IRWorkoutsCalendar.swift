//
//  WorkoutsCalendar.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 07/07/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

extension NSDate {



    
    
    
    func getLocalFirstDayOfWeekDate()->NSDate {
    
        var formatter = NSDateFormatter()
        formatter.dateFormat = "ee"
        let dayOfDifferenceFromFirstDayOfWeek = formatter.stringFromDate(self).toInt()!-1
        var firstDayOfWeek = self.addDaysToDate(-dayOfDifferenceFromFirstDayOfWeek)
        firstDayOfWeek = getEarliestDate(firstDayOfWeek)
        

        return firstDayOfWeek
    
    }
    
    
    func getLocalWeekName()->String{
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "w"
        let weekNr=formatter.stringFromDate(self)
        return formatter.stringFromDate(self)
        
    }
    

    func getLocalFirstDayOfWeekDateString()->String{
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.stringFromDate(getLocalFirstDayOfWeekDate())
        
    }
    
    func getLocalDayName()->String{
       
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE"
        
        let dayName = formatter.stringFromDate(self)
        
       
        return formatter.stringFromDate(self)
        
    }
    
    
    //TODO Better
    //Get 00:00 For Date
    func getEarliestDate(date:NSDate)->NSDate{
        
        var calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        calendar.timeZone = NSTimeZone(abbreviation: "UTC")!
        return calendar.startOfDayForDate(date)
    
    }
    
    
    
    
    
   
    func addDaysToDate(days:Int)->NSDate{
        
        return self.dateByAddingTimeInterval(NSTimeInterval(days*24*60*60))
       
    }
    
    
    func getDateWithNowTime()->NSDate{
    
        var calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        calendar.timeZone = NSTimeZone(abbreviation: "UTC")!
        let components = calendar.components((NSCalendarUnit.SecondCalendarUnit | NSCalendarUnit.MinuteCalendarUnit | NSCalendarUnit.HourCalendarUnit), fromDate: NSDate())
        
        return calendar.dateBySettingHour(components.hour, minute: components.minute, second: components.second, ofDate: self, options: nil)!
    
    
    }
    
    //NSDate should only be used as UTC.
    func getDate(#forLocalDate:Bool)->NSDate{
        
        if (forLocalDate) {
            var calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let interval = NSTimeZone.localTimeZone().secondsFromGMTForDate(self)
            return self.dateByAddingTimeInterval(NSTimeInterval(interval))
        }
        
        return self
    
    }
    
    
    
    

}