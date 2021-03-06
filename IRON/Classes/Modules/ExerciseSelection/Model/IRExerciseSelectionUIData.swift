//
//  IRExerciseSelectionUIData.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

struct IRUIExercise {

    var exerciseName:String
    var groupName:String
    
    init(exerciseName:String, groupName:String){
        self.exerciseName=exerciseName
        self.groupName=groupName
    }
}


struct IRUIExerciseGroup {

    var groupName:String
    var exercises:[IRUIExercise] = []

}