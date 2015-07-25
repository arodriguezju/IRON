//
//  IRSeriesCollectionViewCell.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 02/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRSeriesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var containerUIView: UIView!
    @IBOutlet weak var repsUILabel: UILabel!
    
    @IBOutlet weak var weightUILabel: UILabel!
    
    @IBOutlet weak var flagUIView: UIView!
    
    var cornerRadius :CGFloat  = 3
    var flagRadius:CGFloat = 4
    
    var animationActivated:Bool = false
    
    var active :Bool = false {
        didSet{
            
            if (active) {
                UIView.animateWithDuration(0.2, animations: {
                    self.repsUILabel.textColor = Constants.Colors.serieCellActiveLabel
                    self.weightUILabel.textColor = Constants.Colors.serieCellActiveLabel
                    self.repsUILabel.font = Constants.Fonts.serieCellActiveLabel
                    self.weightUILabel.font = Constants.Fonts.serieCellActiveLabel
                    
                })
                
               
                
                
            }
            else{
                
                self.repsUILabel.textColor = Constants.Colors.serieCellInactiveLabel
                self.weightUILabel.textColor = Constants.Colors.serieCellInactiveLabel
                self.repsUILabel.font = Constants.Fonts.serieCellInactiveLabel
                self.weightUILabel.font = Constants.Fonts.serieCellInactiveLabel
                
                
                
                
            }
            
        }
        
    }
    
    
    
    required  init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
    }
    
    
    
    
    
    
    override func awakeFromNib() {
        
        repsUILabel.textColor = Constants.Colors.serieCellInactiveLabel
        weightUILabel.textColor = Constants.Colors.serieCellInactiveLabel
        repsUILabel.font = Constants.Fonts.serieCellInactiveLabel
        weightUILabel.font = Constants.Fonts.serieCellInactiveLabel
        flagUIView.backgroundColor = UIColor.redColor()
        
    }
    
    
    
    
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addFlagLayer()
    }
    
    
    func setFlag(index:Constants.FlagType) {
        switch index {
            
        case Constants.FlagType.Hard :
            flagUIView.backgroundColor = Constants.Colors.flagRedColor
            
        case Constants.FlagType.Normal :
            flagUIView.backgroundColor = Constants.Colors.flagYellowColor
            
        case Constants.FlagType.Easy :
            flagUIView.backgroundColor = Constants.Colors.flagGreenColor
            
        default:
            
            flagUIView.backgroundColor = Constants.Colors.flagRedColor
            
        }
        
        
        
    }
    
    
    
    func degreesToRadians(value:Double) -> CGFloat {
        
        let pi = M_PI
        return CGFloat((value * pi) / 180.0)
    }
    
    
        
    func addFlagLayer(){
        
        let maskPath = UIBezierPath(arcCenter: CGPointMake(flagUIView.frame.width/2, flagUIView.frame.width/2), radius: flagRadius, startAngle: CGFloat(0.0), endAngle: 360 * CGFloat(M_PI) / 180 , clockwise: true)
        var layer = CAShapeLayer()
        
        layer.frame = CGRect(origin:CGPointMake(0, 0), size: flagUIView.frame.size)
        layer.path = maskPath.CGPath
        layer.fillColor = UIColor.redColor().CGColor
        flagUIView.layer.mask = layer
        
        
    }
    
    
    func prepareCellForItem(serie:IRUISerie){
        
        
        self.weightUILabel.text = "\(serie.weight)"
        self.repsUILabel.text = "\(serie.reps)"
        self.setFlag(serie.flag)
        
        
        
        
        
    }
    
}
