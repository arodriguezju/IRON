//
//  IRWeight.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 25/07/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit


class IRRawWeight {
    
    var weightUnit:Constants.WeightUnits
    var weight:CGFloat {
        
        didSet {
        
            weight = IRRawWeight.roundWeightWithDefaultSteps(weight)
        
        }
    
    }
    
    static  var preferredUnitForUser:Constants.WeightUnits = IRRawWeight.getPreferredWeightUnit()
    lazy var preferredWeightForUser:CGFloat = self.getPreferredWeight()
    
   
    
    
    init(weight:CGFloat, weightUnit:Constants.WeightUnits){
        
        self.weightUnit = weightUnit
        self.weight = IRRawWeight.roundWeightWithDefaultSteps(weight)
    
    }
    
    private func getPreferredWeight() -> CGFloat {
        
        
        
        IRRawWeight.preferredUnitForUser.rawValue
        
        if (IRRawWeight.preferredUnitForUser == weightUnit) {
        
            return weight
        
        }
                
        switch weightUnit {
        
        case .Kilograms:
            
            let newWeight = kilogramsToPounds(weight)
            return IRRawWeight.roundWeightWithDefaultSteps(newWeight)
            
        case .Pounds:
            
            let newWeight = poundsToKilograms(weight)
            return IRRawWeight.roundWeightWithDefaultSteps(newWeight)
            
        default: return weight
        
        }
        
        
    }
    
   
    
    private func poundsToKilograms(weight:CGFloat)->CGFloat{
    
        return weight/2.20462
    
    }
    
    
    private func kilogramsToPounds(weight:CGFloat)->CGFloat{
    
        return weight*2.20462
    
    }
    
    
    static func roundWeightWithDefaultSteps(weight:CGFloat)->CGFloat{
        
        let steps = Constants.WeightSteps.DefaultValue.rawValue
        let divider = 1/steps
        let rounded  = round(weight*divider)/divider
    
        return rounded
    
    
    }
    
    static func getPreferredWeightUnit()->Constants.WeightUnits{
        
        
        let userDefaults=NSUserDefaults.standardUserDefaults()
        let weightUnits = userDefaults.stringForKey(Constants.UserDefaultsKeys.WeightUnits.rawValue)!
        return Constants.WeightUnits(rawValue: weightUnits)!
        
    }

    
}