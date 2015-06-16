//
//  IRExerciseSelectionInteractor.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation
import UIKit

class IRExerciseSelectionInteractor : IRExerciseSelectionInteractorInput {
    
    var output:IRExerciseSelectionInteractorOutput?
    var dataManager : IRExerciseSelectionDataManager


    init(dataManager:IRExerciseSelectionDataManager){
    
        self.dataManager = dataManager
    
    }
    
    func findAvailableExercises(){
    
        dataManager.getAvailableExercises({ rawArray in
            self.output!.foundAvailableExercises(rawArray as [IRRawExercise])
        })

    
    }

}
