//
//  IRExerciseSelectionInteractorIO.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation
import UIKit

protocol IRExerciseSelectionInteractorInput {
    
    func findAvailableExercises()
    

}
protocol IRExerciseSelectionInteractorOutput {
    
    func foundAvailableExercises(exercises:[IRRawExercise])

    
}