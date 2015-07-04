//
//  IRExerciseSelectionDataManager.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation



class IRExerciseSelectionDataManager {

    var coreDataStore : IRCoreDataStore = IRCoreDataStore.sharedInstance

    
    func getAvailableExercises(completion:([IRRawExercise])-> Void){
        
        
        
        let exercises = coreDataStore.getAllExercises()
        
        
        
        
        completion(coreDataToRawData(exercises))
    }
    
    
    func coreDataToRawData(data:[IRExercise])->[IRRawExercise] {
    
        var output:[IRRawExercise]=[]
    
        for coreDataExercise in data {
        
            output.append(IRRawExercise(exerciseName:coreDataExercise.exerciseName, groupName:coreDataExercise.groupName))
            
        
        }
        
        return output
    
    
    }


}