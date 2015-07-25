//
//  IRSpinAnimationLayer.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 25/07/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRSpinAnimationLayer: CALayer {
    
    
    
    init(size:CGSize) {
        super.init()
       self.createLayer(CGRect(origin: CGPointZero, size: size))
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init!(layer: AnyObject!) {
        super.init(layer:layer)
    }
    
    
    
    func createLayer(frame:CGRect) {
        
        let precisionDegrees = 1
        let replicatorLayer = CAReplicatorLayer()
        let instanceCount = Int(360/precisionDegrees)
        let instanceOffset = 1.0/Float(instanceCount)
        
        
        replicatorLayer.frame = frame
        
        
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceDelay = CFTimeInterval(0.004)
        replicatorLayer.preservesDepth = true
        replicatorLayer.instanceColor = Constants.Colors.mainActiveColor.CGColor
        
        
        
        let angle = Float(M_PI * Double(precisionDegrees)) / 180
        
        var transform  = CATransform3DIdentity;
        
        transform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        
        replicatorLayer.instanceTransform = transform
        self.addSublayer(replicatorLayer)
        
        let instanceLayer = CAShapeLayer()
        let layerWidth: CGFloat = 2.0
        let midX = CGRectGetMidX(frame)
        
        
        instanceLayer.frame = CGRect(x: midX, y: 1, width: layerWidth, height: layerWidth)
        
        
        instanceLayer.cornerRadius = 2
        
        instanceLayer.backgroundColor = UIColor.whiteColor().CGColor
        
        
        replicatorLayer.addSublayer(instanceLayer)
        
        
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = -0.5
        fadeAnimation.duration = CFTimeInterval(Float(replicatorLayer.instanceCount)*Float(replicatorLayer.instanceDelay))
        
        fadeAnimation.repeatCount = MAXFLOAT
        
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.toValue = 0
        scaleAnimation.duration = CFTimeInterval(Float(replicatorLayer.instanceCount)*Float(replicatorLayer.instanceDelay))
        scaleAnimation.repeatCount = MAXFLOAT
        
        
        
        instanceLayer.opacity = 0.0
        instanceLayer.addAnimation(fadeAnimation, forKey: "FadeAnimation")
        instanceLayer.addAnimation(scaleAnimation, forKey: "scale")
        
        
        
    }
   
}
