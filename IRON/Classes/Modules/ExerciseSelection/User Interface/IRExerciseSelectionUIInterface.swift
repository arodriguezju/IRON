//
//  IRExerciseSelectionUIInterface.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation


protocol IRExerciseSelectionUIInterface   {


    func updateAndDisplayGroupsData(data:Dictionary<String,Array<IRUIExercise>>)
    func displayExercisesFromGroup(index:Int)
    func displayCurrentGroupData()
    
    



}