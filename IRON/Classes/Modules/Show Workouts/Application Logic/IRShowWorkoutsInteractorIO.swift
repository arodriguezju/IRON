//
//  IRShowWorkoutsInteractorIO.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation



protocol IRShowWorkoutsInteractorInput {
    
    func findWorkouts()


}

protocol IRShowWorkoutsInteractorOutput {
    
    func foundWorkouts()
    
}