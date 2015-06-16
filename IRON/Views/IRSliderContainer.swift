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
    var currentSerie : IRSerie? {
    
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
    
  
    
    func sliderDidRotate(sender: IRSliderView , angle : CGFloat, direction : Constants.SliderDirection )
    {
        
         NSLog("\(angle)")
        
        accumulatedDegrees += angle
        
        if(accumulatedDegrees > sliderSensitivity ) {
            
            accumulatedDegrees = 0
            if ( direction == Constants.SliderDirection.Clockwise)
                
            {
                if ( sender.tag == 1) //Left
                {
                    
                    
                    currentSerie!.weight = NSNumber(float: currentSerie!.weight.floatValue - Float(weightSteps) )
                    
                    IRPersistanceManager.sharedInstance.saveNewWeight(NSNumber(float: currentSerie!.weight.floatValue - Float(weightSteps) ), forSerie: currentSerie!)
                    

                
                }
                else if ( sender.tag == 2) //Right
                {
                    
                      currentSerie!.reps = NSNumber(float: currentSerie!.reps.floatValue + Float(repsSteps) )
                    
                }
            
            }
            else if ( direction == Constants.SliderDirection.CounterClockwise)
            {
                if ( sender.tag == 1) //Left
                    
                    
                {
                    currentSerie!.weight = NSNumber(float:  currentSerie!.weight.floatValue + Float(weightSteps) )
                    
                   

                    
                }
                else if ( sender.tag == 2) //Right
                {
                    
                    currentSerie!.reps = NSNumber(float: currentSerie!.reps.floatValue - Float(repsSteps))
                   
                }
               
            
            
            }
            self.updateLabels()
            
        }
    
   // NSLog("Rotating with angle \(angle)")
    
    }

    
    func updateWeightLabel () {
    
        //currentWeight += weightSteps
        
        
        weightAmountUILabel.text = "\(currentSerie!.weight.floatValue)"
        
        
    
    
    
    }
    
    func updateRepsLabel () {
        
        //currentWeight += weightSteps
        
        //repsAmountUILabel.text = "\(currentSerie!.reps)"
        
        
        repsAmountUILabel.text = "\(currentSerie!.reps.floatValue)"

        
        
    }

    
    
    func updateLabels(){
    
        if let serie = currentSerie {
            self.updateWeightLabel()
            self.updateRepsLabel()
        }
       
    }
    
    
    func setActiveSerie(serie:IRUISerie){
        
             weightAmountUILabel.text = "\(Int(serie.weight))"
             repsAmountUILabel.text = "\(Int(serie.reps))"

    }
    
    
}
