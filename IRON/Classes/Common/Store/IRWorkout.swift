//
//  IRWorkout.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 16/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation
import CoreData

class IRWorkout: NSManagedObject {

    @NSManaged var dateAdded: NSDate
    @NSManaged var idUser: String
    @NSManaged var idWorkout: String
    @NSManaged var series: NSSet

}
