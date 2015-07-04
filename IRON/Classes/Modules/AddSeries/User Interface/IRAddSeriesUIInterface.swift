//
//  IRAddSeriesInterface.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit
protocol IRAddSeriesUIInterface {
    
   // func updateContainerDisplayedData()
    
   // func setActiveSerie(serie:IRUISerie)
    
    
    func setCurrentWorkout(workout:IRUIWorkout)
    
    func setCurrentSerie(atIndex index:Int)
    func setLastSerieAsCurrentSerie()
    
    func getCurrentSerie()->IRUISerie?
    func getCurrentWorkout()->IRUIWorkout?
    func getCurrentIndex()->Int?
    func getCurrentExercise()->String!

    
    func updateSerie(serie:IRUISerie, atIndex index:Int)
    func updateCurrentSerie(serie:IRUISerie)
    func addSerie(serie:IRUISerie)
    
    
    //func getWeight(newWeight : CGFloat)
   // func getReps(newWeight : CGFloat)
    

}
