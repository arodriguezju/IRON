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
    private var flashActiveLayer :CALayer?
    
    var cornerRadius :CGFloat  = 3
    var flagRadius:CGFloat = 4
    
    var active :Bool = false {
        didSet{
            
            if (active) {
                UIView.animateWithDuration(0.2, animations: {
                    self.repsUILabel.textColor = Constants.Colors.serieCellActiveLabel
                    self.weightUILabel.textColor = Constants.Colors.serieCellActiveLabel
                    self.repsUILabel.font = Constants.Fonts.serieCellActiveLabel
                    self.weightUILabel.font = Constants.Fonts.serieCellActiveLabel
                    
                })
                
                self.activeAnimatedLayer()
                
                
                
            }
            else{
                
                self.repsUILabel.textColor = Constants.Colors.serieCellInactiveLabel
                self.weightUILabel.textColor = Constants.Colors.serieCellInactiveLabel
                self.repsUILabel.font = Constants.Fonts.serieCellInactiveLabel
                self.weightUILabel.font = Constants.Fonts.serieCellInactiveLabel
                
                self.deactivateAnimatedLayer()
                
                
                
            }
            
        }
        
    }
    
    
    
    required  init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
    }
    
    
    func activeAnimatedLayer(){
        
        if let layer = self.flashActiveLayer {
            
            CATransaction.begin()
            CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
            flashActiveLayer!.opacity = 1
            CATransaction.commit()
            
        }
        else{
            
            self.addActiveLayer()
            
        }
        
    }
    
    func deactivateAnimatedLayer(){
        
        
        if let layer = self.flashActiveLayer {
            CATransaction.begin()
            CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
            flashActiveLayer!.opacity = 0
            CATransaction.commit()
            
            
        }
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
    
    
    
    func addActiveLayer(){
        
        let precisionDegrees = 1
        let replicatorLayer = CAReplicatorLayer()
        let instanceCount = Int(360/precisionDegrees)
        let instanceOffset = 1.0/Float(instanceCount)
        
        
        replicatorLayer.frame = self.bounds
        
        
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceDelay = CFTimeInterval(0.004)
        replicatorLayer.preservesDepth = true
        replicatorLayer.instanceColor = Constants.Colors.mainActiveColor.CGColor
        
        
        
        let angle = Float(M_PI * Double(precisionDegrees)) / 180
        
        var transform  = CATransform3DIdentity;
        
        transform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        
        replicatorLayer.instanceTransform = transform
        self.layer.addSublayer(replicatorLayer)
        
        let instanceLayer = CAShapeLayer()
        let layerWidth: CGFloat = 2.0
        let midX = CGRectGetMidX(self.bounds)
        
        
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
        
        
        flashActiveLayer = replicatorLayer
        
        
        
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
