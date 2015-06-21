//
//  flagUIView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 21/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class FlagUIView: UIView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    
    func addFlagLayer(){
        
        
        let centerPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        let maskPath = UIBezierPath(arcCenter: centerPoint, radius: CGRectGetMidX(self.bounds), startAngle: CGFloat(0.0), endAngle: 360 * CGFloat(M_PI) / 180 , clockwise: true)
        var layer = CAShapeLayer()
        
        layer.frame = CGRect(origin:CGPointMake(0, 0), size: self.frame.size)
        layer.path = maskPath.CGPath
        layer.fillColor = UIColor.redColor().CGColor
        self.layer.mask = layer
        //self.layer.addSublayer(layer)
        
        
    }
    
    func setFlag(index:Constants.FlagType) {
        switch index {
            
        case Constants.FlagType.Hard :
            self.backgroundColor = Constants.Colors.flagRedColor
            
        case Constants.FlagType.Normal :
            self.backgroundColor = Constants.Colors.flagYellowColor
            
        case Constants.FlagType.Easy :
            self.backgroundColor = Constants.Colors.flagGreenColor
            
        default:
            
            self.backgroundColor = Constants.Colors.flagRedColor
            
        }
        
        
        
    }
    
    
    
}
