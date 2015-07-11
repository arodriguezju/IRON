//
//  IRAddSeriesViewController.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 04/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit
import CoreData

enum IRAddSeriesInitializationType:Int {
    
        case newWorkout = 1
        case editWorkout = 2

}

class IRAddSeriesViewController: UIViewController,IRAddSeriesUIInterface ,IRSliderDelegate {
  
    var eventHandler : IRAddSeriesEventHandlerInterface?
   // var currentExercise:String!
    var initializationType: IRAddSeriesInitializationType?
    var initializationData: [String:AnyObject]=[:]
    
    @IBOutlet weak var sliderContainer: IRSliderContainer!
    
    @IBOutlet weak var seriesCollectionView: IRSeriesCollectionView!
    var currentWorkout : IRUIWorkout? {
        didSet {
            
            seriesCollectionView.currentSeries = currentWorkout!.series
        
        }
    }
    var currentSerie : IRUISerie?
    var currentIndex : Int? {
    
        didSet {
        
            if( currentIndex < currentWorkout?.series.count) {
            
            currentSerie = currentWorkout?.series[currentIndex!]
            
            }
        
        
        }
    
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let initType = initializationType {
            
            eventHandler!.UIDidLoad(initType)
            
        }
        
       
    }
   
    
    override func viewDidAppear(animated: Bool) {
        
        sliderContainer.sliderLeftView.sliderDelegate = self
        sliderContainer.sliderRightView.sliderDelegate = self
        seriesCollectionView.seriesCollectionViewDelegate = eventHandler

        

       
    }
    
    
    func updateContainerDisplayedData(){
    
    
    }
    
    
    func sliderDidRotate(sender: IRSliderView, angle : CGFloat, direction : Constants.SliderDirection ) {
    
        eventHandler!.sliderDidRotate(sender, angle: angle, direction: direction)
    
    }
    
    func setTopDisplayWithSerie(serie:IRUISerie){
    
        sliderContainer.setActiveSerie(serie)
    
    }
    
    
    func setCurrentWorkout(workout:IRUIWorkout) {
        
        currentWorkout = workout
        
        
    }
    
    func setCurrentSerie(atIndex index:Int) {
    
        if let workout = currentWorkout {
            
            if (currentWorkout!.series.count > index){
                
                currentIndex = index
                currentSerie = workout.series[index]
                self.setTopDisplayWithSerie(currentSerie as IRUISerie!)
                self.seriesCollectionView.selectIndex(index)
            
            }
        }

    
    }
    
    func setLastSerieAsCurrentSerie() {
        setCurrentSerie(atIndex: currentWorkout!.series.count-1)
    }
    
    func getInitializationData() -> [String:AnyObject]{
    
        return initializationData
    
    }
    
    func getCurrentSerie() -> IRUISerie?{
        
        return currentSerie
    
    
    }
    func getCurrentIndex() -> Int? {
    
        return currentIndex
    
    }
    
    func getCurrentWorkout() -> IRUIWorkout? {
        return currentWorkout
    }
    
    /*func getCurrentExercise()->String!{
    
        return currentExercise
    }*/
    
    func updateSerie(serie:IRUISerie, atIndex index:Int) {
        
        if let workout = currentWorkout {            
            
            currentWorkout!.series[index] = serie
            seriesCollectionView.currentSeries = currentWorkout!.series
            
        }
    
    }
    func updateCurrentSerie(serie:IRUISerie) {
        
        updateSerie(serie, atIndex: currentIndex!)
        currentSerie = serie
        self.setTopDisplayWithSerie(serie)
        
    }
    
    
    func addSerie(serie:IRUISerie){
    
        currentWorkout!.series.append(serie)
        seriesCollectionView.currentSeries = currentWorkout!.series
        
    
    }
    
    func sliderDidEndRotate() {
    
        eventHandler!.sliderDidEndRotate()
    
    }

    
}
