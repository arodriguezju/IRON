//
//  IRShowWorkoutsInteractor.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation

class IRShowWorkoutsInteractor: NSObject, IRShowWorkoutsInteractorInput  {
    
    var output:IRShowWorkoutsInteractorOutput?
    var dataManager:IRShowWorkoutsDataManager
    
    
    init(dataManager:IRShowWorkoutsDataManager){
        
        self.dataManager = dataManager
        
    }
    
    
    func findWorkouts(){
    
    
    
    }
    

}
