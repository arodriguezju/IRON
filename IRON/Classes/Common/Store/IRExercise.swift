//
//  Exercise.swift
//  ParseStarterProject
//
//  Created by Angel Rodriguez junquera on 31/05/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import CoreData

class IRExercise: NSManagedObject {

    @NSManaged var idExercise: NSNumber
    @NSManaged var exerciseName: String
    @NSManaged var groupName: String
    @NSManaged var workouts: NSSet


}
