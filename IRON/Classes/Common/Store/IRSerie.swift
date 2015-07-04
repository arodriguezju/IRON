//
//  IRSerie.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 04/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation
import CoreData

class IRSerie: NSManagedObject {

    @NSManaged var reps: NSNumber
    @NSManaged var weight: NSNumber
    @NSManaged var weightUnits: String
    @NSManaged var workout: NSManagedObject
    @NSManaged var flag: NSNumber
    
    
    
  

}
