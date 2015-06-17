//
//  IRSliderView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 03/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit
import Darwin

protocol IRSliderDelegate{

    func sliderDidRotate(sender: IRSliderView, angle : CGFloat, direction : Constants.SliderDirection )
    
    func sliderDidEndRotate()


}

class IRSliderView: UIView {
    
    
   
    
    var sliderDelegate:IRSliderDelegate?
    
    var sliderView : UIView!
    
    var frameCenter : CGPoint!
    var radius : CGFloat = 50
    
    var segments : Double = 300
    var lineDegrees : Double = 0.2 //0.3

    
    var lineWide : CGFloat = 5
    
    
    var sliderLayerItems :NSArray = NSArray()
    
    var segmentsShape : CAShapeLayer!
    
    var viewAngle : CGFloat = 0.0
    
       override func drawRect(rect: CGRect) {
        
        frameCenter = CGPointMake(self.frame.width/2, self.frame.height/2)
        radius = self.frame.height / 2 - lineWide
        
        var startDegree : Double = 0
       
        
        
        
        var degreesProSegment : Double = 360 / segments
        var separationDegrees = degreesProSegment - lineDegrees
        
        var  endDegree : Double = startDegree+lineDegrees
        
        
        
        
        let outputPath2 = UIBezierPath(arcCenter: frameCenter, radius: radius-2, startAngle: degreesToRadians(0), endAngle:degreesToRadians(360) , clockwise: true)
        var shape2 = CAShapeLayer()
        shape2.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        
        shape2.path = outputPath2.CGPath
        shape2.lineWidth = 0
        shape2.strokeColor=UIColor.clearColor().CGColor
        
        shape2.fillColor=UIColor.blackColor().colorWithAlphaComponent(0.01).CGColor
        shape2.masksToBounds = true
        
        
        
        self.layer.addSublayer(shape2)
        
        var outputPath = UIBezierPath()
        var maxSaturation :CGFloat = 1.0
        var minSaturation :CGFloat = 0.75
        let saturationIncrements :CGFloat = 0.01
        var colorDirection = 0
        var currentSaturation = maxSaturation
        
        while (endDegree < 360 ) {
            
            
            
            
            var newPath = UIBezierPath(arcCenter: frameCenter, radius: radius, startAngle: degreesToRadians(startDegree), endAngle:degreesToRadians(endDegree) , clockwise: true)
            
            
            outputPath.appendPath(newPath)
            
            startDegree  = endDegree + separationDegrees
            endDegree  = startDegree+lineDegrees
            
            
        }
        segmentsShape = CAShapeLayer()
        segmentsShape.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
       segmentsShape.path = outputPath.CGPath
        segmentsShape.lineWidth = lineWide
        
        segmentsShape.strokeColor=UIColor.blackColor().colorWithAlphaComponent(0.5).CGColor
        segmentsShape.fillColor=UIColor.blueColor().CGColor
        segmentsShape.masksToBounds = true
        self.layer.addSublayer(segmentsShape)
        
        self.layer.masksToBounds = true
        
        
     
        let maskingImage = UIImage(named: "mask2.png")
        let maskingLayer =  CALayer()
        maskingLayer.frame = self.bounds
        maskingLayer.contents = maskingImage!.CGImage
        self.layer.mask=maskingLayer

       
        
       // self.layer.addSublayer(maskingLayer)

        
        
    }
    
    
   
 


    func degreesToRadians(value:Double) -> CGFloat {
        
        let pi = M_PI
        return CGFloat((value * pi) / 180.0)
    }
    
  
    
    
  
    
    
    
  
    
    /** Calculates the distance between point1 and point 2. */
    func distanceBetweenPoints(point1:CGPoint, point2:CGPoint) ->CGFloat
    {
           let dx = point1.x - point2.x
    let dy = point1.y - point2.y
    return sqrt(dx*dx + dy*dy);
    }
    
    
   
    /** The method is a bit too generic - in our case both lines share the same start point. */
    func angleBetweenLinesInDegrees(beginLineA:CGPoint, endLineA:CGPoint,beginLineB:CGPoint,endLineB:CGPoint) ->CGFloat
    {
    let a = endLineA.x - beginLineA.x;
    let b = endLineA.y - beginLineA.y;
    let c = endLineB.x - beginLineB.x;
    let d = endLineB.y - beginLineB.y;
    
    let atanA = atan2(a, b);
    let atanB = atan2(c, d);
    
    // convert radiants to degrees
    return (atanA - atanB) * 180 / CGFloat(M_PI);
    }
    
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        
        
       // if (self.state == UIGestureRecognizerStateFailed) return
        
        let touch : UITouch = touches.first as! UITouch
        
        let nowPoint  = touch.locationInView(self)
        let prevPoint = touch.previousLocationInView(self)
        
        // make sure the new point is within the area
       // let distance = distanceBetweenPoints(self.center, nowPoint)
        
            // calculate rotation angle between two points
            var angle = self.angleBetweenLinesInDegrees(frameCenter, endLineA: prevPoint, beginLineB: frameCenter, endLineB: nowPoint)
            // fix value, if the 12 o'clock position is between prevPoint and nowPoint
            if (angle > 180)
            {
                angle -= 360;
            }
            else if (angle < -180)
            {
                angle += 360;
            }
            
            // sum up single steps
           // cumulatedAngle += angle;
            
            // call delegate
        
        viewAngle += angle
        if (viewAngle > 360){
            viewAngle -= 360}
        else if (viewAngle < -360){
            viewAngle += 360
        
        }
        if (viewAngle < 0) {
        
        viewAngle += 360
        
        }
        
        
        
       // self.transform = CGAffineTransformMakeRotation(viewAngle *  CGFloat(M_PI) / 180)
        
      //  self.recalculateSegmentsAlpha()
        segmentsShape.transform = CATransform3DMakeRotation(viewAngle *  CGFloat(M_PI) / 180, 0.0, 0.0, 1.0)
        
        
        if let delegate = self.sliderDelegate {
            
            if ( angle > 0) {
                
                delegate.sliderDidRotate(self, angle: abs(angle), direction: Constants.SliderDirection.Clockwise)
            
            }
            else {
                delegate.sliderDidRotate(self, angle: abs(angle), direction: Constants.SliderDirection.CounterClockwise)
            
            }
        
            
        
        }
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
       if let delegate = self.sliderDelegate {
            delegate.sliderDidEndRotate()
        }
        
    }
    
    
    
    func vectorFromPoint(firstPoint:CGPoint ,secondPoint:CGPoint) -> CGPoint
    {
    
       let  x :CGFloat = secondPoint.x-firstPoint.x
        let  y:CGFloat  = secondPoint.y-firstPoint.y;
    
    return CGPointMake(x, y)
    }
        
    
}
