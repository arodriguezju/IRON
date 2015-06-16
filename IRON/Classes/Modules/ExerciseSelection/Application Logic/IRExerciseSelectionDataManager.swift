//
//  IRExerciseSelectionDataManager.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation



class IRExerciseSelectionDataManager {



    
    func getAvailableExercises(completion:([IRRawExercise])-> Void){
        
        var outputArray : [IRRawExercise] = []
        
        outputArray.append(IRRawExercise(exerciseName:"Bench Press", groupName: "Chest"))
        outputArray.append(IRRawExercise(exerciseName:"Incline Bench Press", groupName: "Chest"))

        outputArray.append(IRRawExercise(exerciseName:"Decline Bench Press", groupName: "Chest"))

        outputArray.append(IRRawExercise(exerciseName:"Squats", groupName: "Legs"))
        outputArray.append(IRRawExercise(exerciseName:"Front Squat", groupName: "Legs"))


        
        
                completion(outputArray)
    }
    


}