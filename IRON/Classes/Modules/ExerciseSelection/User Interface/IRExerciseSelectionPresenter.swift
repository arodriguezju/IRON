//
//  File.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation


class IRExerciseSelectionPresenter : IRExerciseSelectionInteractorOutput,IRExerciseSelectionEventHandler {

    var userInterface:IRExerciseSelectionUIInterface?
    var exerciseSelectionInteractor: IRExerciseSelectionInteractorInput?
    var exerciseSelectionWireframe : IRExerciseSelectionWireframe?
    
    var initializationData : [String:AnyObject?]?


    private var displayingGroups = true
    

    
    func UIDidLoad(){
    
        exerciseSelectionInteractor!.findAvailableExercises()
        
        
        self.setTimePicker()
        
    }
    
    
    func setTimePicker(){
        
        

        
        if let data = initializationData {
            
            if let pickerDate:AnyObject? = data["pickerDate"] {
                
                if let pickerDate = pickerDate as? NSDate {
                    
                    userInterface?.setTimePicker(date: pickerDate)
                    
                }
                
                
            }
            
            
        }

    
    
    }
    
    func foundAvailableExercises(exercises:[IRRawExercise]) {
    
        var exercisesForUI = prepareRawDataForUI(exercises)
        
        userInterface!.updateAndDisplayGroupsData(exercisesForUI)
        displayingGroups = true
    
    }

    func prepareRawDataForUI(exercises:[IRRawExercise])-> Dictionary<String,Array<IRUIExercise>>{
    
        var groups = Dictionary<String,Array<IRUIExercise>>()
        
        for rawExercise in exercises {
            
            var exercise = IRUIExercise(exerciseName: rawExercise.exerciseName, groupName: rawExercise.groupName)
            
            if let exercises = groups[exercise.groupName] {
            
                 groups[exercise.groupName]!.append(exercise)
            
            }
            else{
                var exercises : [IRUIExercise] = []
                exercises.append(exercise)
                groups[exercise.groupName] = exercises
            }
        
        }
        return groups
        
    }
    
   
    
   func exerciseSelectionTableViewDidClick(index:Int, item:String){
    
    //TODO BETTER
        
        if (displayingGroups){
            userInterface!.displayExercisesFromGroup(index)
            displayingGroups = false
        }
        else{
            
            if let dateForPicker = userInterface?.getDateFromPicker() {
                exerciseSelectionWireframe!.exerciseSelected(item,withDate:userInterface!.getDateFromPicker())
            }
            else{
                exerciseSelectionWireframe!.exerciseSelected(item,withDate:nil)
            }
            
            userInterface!.displayCurrentGroupData()
            displayingGroups=true
        }
    
    }
    
    func backButtonDidClick(){
        
        if (!displayingGroups){
            userInterface?.displayCurrentGroupData()
            displayingGroups=true
    
        }
        else{
        
        
            
        }
    
    }
}