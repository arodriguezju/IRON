//
//  PersistanceManager.swift
//  ParseStarterProject
//
//  Created by Angel Rodriguez junquera on 31/05/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import CoreData

class IRPersistanceManager: NSObject {
    static let sharedInstance = IRPersistanceManager()
    
    //Cache variables
    private var exercisesByName:NSArray?
    
    
    func getAllExercises()->NSArray?{
        
        
        if let exercisesByName = exercisesByName {
            
            return exercisesByName
            
        }
        
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        var fetch = NSFetchRequest()
        var exerciseEntity = NSEntityDescription.entityForName("Exercise",
            inManagedObjectContext:
            managedContext)
        fetch.entity=exerciseEntity
        
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetch,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            
            exercisesByName = results
            
            return results
            
        } else {
            
            return nil
        }
        
    }
    
}
