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
    
    
    func getAllWorkouts()->[IRWorkout]{
    
    
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
            error: &error) as! [IRWorkout]
        
        
        return fetchedResults
    
    
    }
    
    func createExercises() {
    
    
        
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            
            managedContext = appDelegate.managedObjectContext!
            
            var exerciseEntity = NSEntityDescription.entityForName("IRExercise",inManagedObjectContext:  managedContext!)
            var exercise = NSManagedObject(entity: exerciseEntity!,insertIntoManagedObjectContext:managedContext!) as! IRExercise
                exercise.exerciseName = "Bench Press"
                exercise.groupName = "Chest"
        
            exercise = NSManagedObject(entity: exerciseEntity!,insertIntoManagedObjectContext:managedContext!) as! IRExercise
            exercise.exerciseName = "Incline Bench Press"
            exercise.groupName = "Chest"

        
            exercise = NSManagedObject(entity: exerciseEntity!,insertIntoManagedObjectContext:managedContext!) as! IRExercise
            exercise.exerciseName = "Squats"
            exercise.groupName = "Legs"
        
            exercise = NSManagedObject(entity: exerciseEntity!,insertIntoManagedObjectContext:managedContext!) as! IRExercise
            exercise.exerciseName = "Front Squats"
            exercise.groupName = "Legs"
        
        
            
            managedContext?.save(nil)
            
            
        
    
    
    
    }
    
    func createDummyWorkouts() {
        
        deleteAllWorkouts()
        
        getAllExercises()
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext!
        
        
        
        var dates:[NSDate]=[NSDate(),
            NSDate().dateByAddingTimeInterval(-2*24*60*60),
            NSDate().dateByAddingTimeInterval(-3*24*60*60),
            NSDate().dateByAddingTimeInterval(-4*24*60*60),
            NSDate().dateByAddingTimeInterval(-5*24*60*60),
            NSDate().dateByAddingTimeInterval(-6*24*60*60),
            NSDate().dateByAddingTimeInterval(-7*24*60*60)
        ]
        
        var exercises:[String] = ["Bench Press","Bench Press","Bench Press","Bench Press","Bench Press","Bench Press","Bench Press"]
        
        var i:Int=0
        for date in dates {
        
            var workout = getNewWorkout(exerciseName: exercises[i], workoutDate: date)
     
            
            var serie = getNewSerie()
            serie.workout = workout
            
             managedContext!.save(nil)
            
            i++
        }
        
        
        
               
       
        
        
        
        
        
        
    }
    
    func deleteAllWorkouts(){
    
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext!

    
        var workouts  = getAllWorkouts()
        
        for workout in workouts {
        
        
                managedContext?.deleteObject(workout)
        }
        
        managedContext?.save(nil)
    
    }
   
    
    func getAllExercises()->[IRExercise]{
        
        
        
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext!
        
        var fetch = NSFetchRequest()
        var exerciseEntity = NSEntityDescription.entityForName("IRExercise",
            inManagedObjectContext:
            managedContext!)
        fetch.entity=exerciseEntity
        
        var error: NSError?
        
        let fetchedResults =
        managedContext!.executeFetchRequest(fetch,
            error: &error) as! [IRExercise]
        
        if fetchedResults.count != 0 {
        
            return fetchedResults
        }
        else{
            
            createExercises()
            return getAllExercises()
        
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
                
            
            //    NSLog("\(workout.idWorkout)")
                
                
                for serie in workout.series {
                    
                    let serie = serie as! IRSerie
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
        
        serie.weightUnits = Constants.WeightUnits.Kilograms.rawValue
        serie.reps = 0
        serie.weight = 0
        serie.flag = Constants.FlagType.Easy.rawValue
        
            
        return serie
        
        
    }
    
    
    
    
    func getNewWorkout() ->IRWorkout{
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext!
        
        var workoutEntity = NSEntityDescription.entityForName("IRWorkout",inManagedObjectContext:  managedContext!)
        var workout = NSManagedObject(entity: workoutEntity!,insertIntoManagedObjectContext:managedContext!) as! IRWorkout
        
        workout.dateAdded = NSDate()
        workout.dateWorkout = NSDate()

        
       return workout
        
        
    }
    
    
    func getNewWorkout(#exerciseName:String, workoutDate:NSDate)->IRWorkout{
        
        
    
        var cdWorkout = getNewWorkout()
        var cdExercise = getExerciseWithName(exerciseName)
        
        cdWorkout.exercise = cdExercise!
        cdWorkout.dateWorkout = workoutDate
        var cdSerie = getNewSerie()
        
        //TODO Better
        cdSerie.workout = cdWorkout
        cdSerie.weight = 30
        cdSerie.reps = 5
        cdSerie.weightUnits = IRRawWeight.preferredUnitForUser.rawValue
        cdSerie.flag = Constants.FlagType.Easy.rawValue
        
        save()
            
        return cdWorkout
    
    }

    func save() {
        managedContext?.save(nil)
    }
    
    func getWorkoutAtAddedDate(date:NSDate)->IRWorkout?{
    
        
        var fetch = NSFetchRequest()
        var workoutEntity = NSEntityDescription.entityForName("IRWorkout",
            inManagedObjectContext:
            managedContext!)
        
        fetch.entity=workoutEntity
        
        let predicate = NSPredicate(format: "dateAdded== %@", date)
        fetch.predicate = predicate
        
        var error: NSError?
        
        let fetchedResults =
        managedContext!.executeFetchRequest(fetch,
            error: &error) as! [IRWorkout]
        
        if fetchedResults.count > 0 {
            return fetchedResults.first
        }
        else{
            
            return nil
        }
        

    
    }
    
    func getExerciseWithName(name:String)->IRExercise?{
    
       var fetch = NSFetchRequest()
        var exerciseEntity = NSEntityDescription.entityForName("IRExercise",
            inManagedObjectContext:
            managedContext!)
        
        fetch.entity=exerciseEntity
        
        let predicate = NSPredicate(format: "exerciseName == %@", name)
        fetch.predicate = predicate
        
        var error: NSError?
        
        let fetchedResults =
        managedContext!.executeFetchRequest(fetch,
            error: &error) as! [IRExercise]
        
        if fetchedResults.count > 0 {
            return fetchedResults.first
        }
        else{
        
            return nil
        }
    
    
    }

    func deleteSerie(serie:IRSerie){
    
            managedContext!.deleteObject(serie)
            save()
    
    }
    
    func deleteWorkout(workout:IRWorkout){
        
        managedContext!.deleteObject(workout)
        save()
        
    }
    
    
}
