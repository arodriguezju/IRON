//
//  IRSliderContainer.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 04/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRSliderContainer: UIView {
    
    @IBOutlet weak var weightAmountUILabel: UILabel!
    @IBOutlet weak var weightUnitsUILabel: UILabel!
    @IBOutlet weak var repsAmountUILabel: UILabel!
    @IBOutlet weak var repsUnitsUILabel: UILabel!
    
    @IBOutlet weak var sliderLeftView: IRSliderView!
    @IBOutlet weak var sliderRightView: IRSliderView!
    
    
    private var accumulatedDegrees : CGFloat = 0
    private var sliderSensitivity : CGFloat = 1
    private var weightSteps : CGFloat = 0.25
    private var repsSteps : CGFloat = 0.25
    var currentSerie : IRUISerie? {
    
        didSet {
         self.updateLabels()
        
        
        }
    
    
    }
    
    private var currentWeight : CGFloat = 30

    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
     

       
    }

    
   required  init(coder aDecoder: NSCoder) {
    
        super.init(coder: aDecoder)
    
    
    
           }
    
    
    override func awakeFromNib() {
        
              // currentSerie = IRSerie()

      
    }
    


    
    private func updateWeightLabel () {
        
        weightAmountUILabel.text = "\(Int(currentSerie!.weight))"
        
      
    
    
    }
    
     private func updateRepsLabel () {
        
        
            repsAmountUILabel.text = "\(Int(currentSerie!.reps))"
        
        
    }
    
    private func updateWeightUnitLabel () {
        
        
        weightUnitsUILabel.text = currentSerie!.weightUnit.rawValue
        
        
    }

    
    
    func updateLabels(){
    
        if let serie = currentSerie {
            self.updateWeightLabel()
            self.updateRepsLabel()
            self.updateWeightUnitLabel()
        }
       
    }
    
    
    func setActiveSerie(serie:IRUISerie){
            currentSerie = serie

    }
    
    
}
