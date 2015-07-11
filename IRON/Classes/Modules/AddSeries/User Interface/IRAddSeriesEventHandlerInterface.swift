//
//  IRAddSeriesEventInterface.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//


import UIKit
protocol IRAddSeriesEventHandlerInterface : IRSliderDelegate , IRSeriesCollectionViewDelegate {
    
   // func sliderDidChanged()
    
    func UIDidLoad(withInitType: IRAddSeriesInitializationType)
    
   /* func sliderDidRotate(sender: IRSliderView, angle : CGFloat, direction : Constants.SliderDirection)*/
    
}
