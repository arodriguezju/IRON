//
//  IRSliderView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 03/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit
import Darwin

class IRSliderView: UIView {
    
    var framePoint : CGPoint = CGPointMake(50, 50)
    var radius : CGFloat = 50
    var lineWidth = 5
    var separationDegrees : Double = 5

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        var startDegree :Double = 0
        var lineDegree : Double = 1
        var  endDegree : Double = startDegree+lineDegree
        
        var outputPath = UIBezierPath()
        
        while (endDegree < 360 ) {
            
            
            
            var newPath = UIBezierPath(arcCenter: framePoint, radius: radius, startAngle: degreesToRadians(startDegree), endAngle:degreesToRadians(endDegree) , clockwise: true)
       
            outputPath.appendPath(newPath)
            
            startDegree  = endDegree + separationDegrees
            endDegree  = startDegree+lineDegree
            
            
        }
        var shape = CAShapeLayer()
        shape.frame = CGRectMake(10, 10, self.frame.width, self.frame.height)
        shape.path = outputPath.CGPath
        shape.lineWidth = 5
        shape.strokeColor=UIColor.whiteColor().CGColor
        //shape.fillColor=UIColor.blueColor().CGColor
        shape.masksToBounds = true
        self.layer.addSublayer(shape)
        
        
    }


    func degreesToRadians(value:Double) -> CGFloat {
        
        let pi = M_PI
        return CGFloat((value * pi) / 180.0)
    }
    
    
}
