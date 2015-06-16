//
//  PersistanceManager.swift
//  ParseStarterProject
//
//  Created by Angel Rodriguez junquera on 31/05/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import CoreData

class IRCoreDataStore: NSObject {
    static let sharedInstance = IRCoreDataStore()
    
    //Cache variables
    private var exercisesByName:NSArray?
    
    private var managedContext:NSManagedObjectContext?
    
    
    func getAllExercises()->NSArray?{
        
        
        if let exercisesByName = exercisesByName {
            
            return exercisesByName
            
        }
        
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext!
        
        var fetch = NSFetchRequest()
        var exerciseEntity = NSEntityDescription.entityForName("Exercise",
            inManagedObjectContext:
            managedContext!)
        fetch.entity=exerciseEntity
        
        var error: NSError?
        
        let fetchedResults =
        managedContext!.executeFetchRequest(fetch,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            
            exercisesByName = results
            
            return results
            
        } else {
            
            return nil
        }
        
    }
    
    
    func printAllSeries(){
        
        
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext!
        
        var fetch = NSFetchRequest()
        var exerciseEntity = NSEntityDescription.entityForName("IRWorkout",
            inManagedObjectContext:
            managedContext!)
        fetch.entity=exerciseEntity
        
        var error: NSError?
        
        let fetchedResults =
        managedContext!.executeFetchRequest(fetch,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            
            for workout in results as! [IRWorkout] {
                
            
                NSLog("\(workout.idWorkout)")
                
                for serie in workout.series.allObjects as! [IRSerie] {
                
                    NSLog("\(serie.reps)")

                
                }
            
            }
            
            
        }
            
            
    }
    
    
    func saveNewWeight(newWeight :NSNumber, forSerie serie:IRSerie){
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        serie.weight = newWeight
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
            
        }
        else{
            NSLog("\(serie.weight.floatValue)  ")
            
        }
        
        
        
        
        
    }
    
    func getNewSerie() ->IRSerie{
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext!
        
        var exerciseEntity = NSEntityDescription.entityForName("IRSerie",inManagedObjectContext:  managedContext!)
        let serie = NSManagedObject(entity: exerciseEntity!,insertIntoManagedObjectContext:managedContext!) as! IRSerie
        
        serie.reps = 0
        serie.weight = 0
        
        
        
            
            return serie
        
        
    }
    
    func getNewWorkout() ->IRWorkout{
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext!
        
        var workoutEntity = NSEntityDescription.entityForName("IRWorkout",inManagedObjectContext:  managedContext!)
        let workout = NSManagedObject(entity: workoutEntity!,insertIntoManagedObjectContext:managedContext!) as! IRWorkout
        
        
        
       
            return workout
        
        
    }

    func save() {
        managedContext?.save(nil)
    }

    
    
}
