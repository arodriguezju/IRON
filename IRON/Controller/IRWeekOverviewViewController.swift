//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //var currentWorkout : PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.startUp()
       // self.signUpUser()
       // self.login()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  /*  func signUpUser() {
        var user = PFUser()
        user.username = "admin"
        user.password = "admin"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                NSLog("User Signed Up! ERROR")
            } else {
                NSLog("User Signed Up!")
            }
        }
    }
    
    func login(){
        
        
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            
            NSLog("User Logged in! With Session")

            self.startUp()
            // Do stuff with the user
        } else {
           
            PFUser.logInWithUsernameInBackground("admin", password:"admin") {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    NSLog("User Logged in!")
                    self.startUp()
                    
                    
                } else {
                    NSLog("User Logged In! Error")
                    
                }
            }

            
        }
        
}*/
    
    func startUp(){
        NSLog("Starting!")
        
        self.CDCreateExercise(name: "Bench Press", group: "Chest")
        self.CDCreateExercise(name: "Incline Bench Press", group: "Chest")
        self.CDCreateExercise(name: "Squats", group: "Legs")
        self.CDCreateExercise(name: "Front Squat", group: "Legs")
        
     //   self.getExercises()

      /*  self.createWorkout()
        self.createWorkout()

        self.createWorkout()

        self.createWorkout()

        self.createWorkout()

        self.createWorkout()

        NSThread.sleepForTimeInterval(3)
        
       self.getWorkoutsFromUser()*/
    
        
    }
    
        
        
    
    func CDCreateExercise(name nameEx:String, group groupEx:String){
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        var exerciseEntity = NSEntityDescription.entityForName("Exercise",
            inManagedObjectContext:
            managedContext)
        let exercise = NSManagedObject(entity: exerciseEntity!,
            insertIntoManagedObjectContext:managedContext)
        
        exercise.setValue(nameEx, forKey: "exerciseName")
        exercise.setValue(groupEx, forKey: "groupName")

        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    
    }
    
    
        
    
   /* func createExercise(name nameEx:String, group groupEx:String){
        
        var newExercise = PFObject(className:"Exercise")
        newExercise["name"] = nameEx
        newExercise["group"] = groupEx
        
        newExercise.saveInBackground()
    
    
    }
    
    //Workout idUser idWorkout Date
    //Series idUser idWorkout idExercise reps series weight
    func createWorkout(){
        
        var workout = PFObject(className:"Workout")
        workout.pinInBackground()

        
        workout["user"] = PFUser.currentUser()
        workout["newField12"] = "test"

        currentWorkout=workout
        
        var workoutACL = PFACL(user:PFUser.currentUser()!)
        
        workoutACL.setPublicReadAccess(true)
        workout.ACL = workoutACL
        
        workout.saveEventually()
        
       
    
    }
    
    func addSerie(){
    
    
    
    
    }
    
    func getWorkoutsFromUser(){
    
        let workoutQuery = PFQuery(className:"Workout")
        
        workoutQuery.fromLocalDatastore()
        //workoutQuery.cachePolicy=PFCachePolicy.IgnoreCache
        
        if let user = PFUser.currentUser() {
            
            workoutQuery.whereKey("user", equalTo: user)
            workoutQuery.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    println("Successfully retrieved \(objects!.count) workouts.")
                    // Do something with the found objects
                    if let objects = objects as? [PFObject] {
                        for object in objects {
                          //  println(object.objectId)
                            if let string :String = object["newField12"] as? String {
                                NSLog("NewField \(string)")
                            
                            }
                            //object["newField3"] = "testNewField"
                           // object.saveEventually()
                        }
                    }
                } else {
                    // Log details of the failure
                    println("Error: \(error!) \(error!.userInfo!)")
                }
            
            
            
        }
        
        

    
    }
    }*/
}

