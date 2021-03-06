//
//  AddSeriesPresenter.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 06/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRAddSeriesPresenter: NSObject, IRAddSeriesInteractorOutput,IRAddSeriesEventHandlerInterface {
    
    var userInterface : IRAddSeriesUIInterface!
    var addSeriesInteractor: IRAddSeriesInteractorInput!
    

    private var accumulatedDegrees :CGFloat = 0
    
    var slidersSensitivityAngle : CGFloat = 5
    
    
    func seriesCollectionViewCellDidClick(index:Int) {
        
        if let currentWorkout = userInterface.getCurrentWorkout()
        {
            
            if currentWorkout.series.count > index {
                
                if( userInterface.getCurrentIndex() == index ){
                    
                    var serie = currentWorkout.series[index]
                    serie.flag = getNextFlagForSerie(serie)
                    //addSeriesInteractor.updateSerie(self.prepareUIDataToRaw(serie), atIndex: index)
                    addSeriesInteractor.updateSerieForCurrentWorkout(serie.weight, reps: serie.reps,flag:serie.flag, atIndex: index)
                    userInterface.updateCurrentSerie(serie)
                    
                
                }
                else{
                    userInterface.setCurrentSerie(atIndex: index)
                
                }
            }
            else {
                
                addSeriesInteractor.findNewSerie()
            }
        
        }
            
        
    }
    
    func getNextFlagForSerie(serie:IRUISerie)->Constants.FlagType{
    
        if ( serie.flag == Constants.FlagType.Hard) {
            return Constants.FlagType.Easy
        }
        else
        {
            
        return Constants.FlagType(rawValue: serie.flag.rawValue + 1)!
        }
        
    
    }

    
    func foundWorkout(workout:IRRawWorkout?){
        
        
        if let workout = workout {
        
            let workoutUIReady = prepareRawDataForUI(workout)
            userInterface.setCurrentWorkout(workoutUIReady)
            userInterface.setCurrentSerie(atIndex: 0)
        
        }
        
    }
    
    func foundNewSerie(serie: IRRawSerie) {
        let serieUI = prepareRawDataForUI(serie)
        
        userInterface.addSerie(serieUI)
        userInterface.setLastSerieAsCurrentSerie()
    
    }
    
    
    func UIDidLoad(){
        
        let data = userInterface.getInitializationData()
        let workoutDate = data["workoutDate"] as! NSDate
        let exerciseName = data["exerciseName"] as! String
        if let workoutAddedDate:AnyObject = data["workoutAddedDate"]!  {
        let date = workoutAddedDate as! NSDate
        
            addSeriesInteractor!.findWorkoutWithDate(date)
        }
        else{
            addSeriesInteractor.findNewWorkout(exerciseName: exerciseName, workoutDate:workoutDate)
        }

    
    }
    
    
    func prepareRawDataForUI(workout:IRRawWorkout)->IRUIWorkout{
    
        var workoutOutput : IRUIWorkout = IRUIWorkout()
        workoutOutput.dateWorkout = workout.dateWorkout
        
        for serie in workout.series {
            
            workoutOutput.series.append(self.prepareRawDataForUI(serie))
        
        }
       
        return workoutOutput
    
    }
    
    
    func prepareRawDataForUI(serie:IRRawSerie) -> IRUISerie{
        
        var serieOutput : IRUISerie = IRUISerie(weight: serie.weight.preferredWeightForUser, weightUnit:IRRawWeight.preferredUnitForUser, reps: serie.reps, flag: serie.flag)
        return serieOutput
                
    }
    
    
    
    func sliderDidRotate(sender: IRSliderView , angle : CGFloat, direction : Constants.SliderDirection )
    {
        
        accumulatedDegrees+=angle
        
        if (abs(accumulatedDegrees) > slidersSensitivityAngle) {
            var currentSerie = userInterface.getCurrentSerie()
        
            if( sender.tag == 1 ) {
                
                let weightStep = addSeriesInteractor.getWeightSteps(Constants.WeightUnits.Kilograms)
                
                
                if ( direction == Constants.SliderDirection.Clockwise ){
                    currentSerie!.weight -= weightStep
                }
                else{
                    
                     currentSerie!.weight += weightStep
                }
            
            }
            
            if( sender.tag == 2) {
                
                
                let repStep = addSeriesInteractor.getRepSteps()
                
                
                if ( direction == Constants.SliderDirection.Clockwise ){
                    currentSerie!.reps += repStep
                }
                else{
                    currentSerie!.reps -= repStep
                }       

                
                
            }
            
            
            accumulatedDegrees = 0
            
            if ( currentSerie!.weight >= 0 && currentSerie!.reps >= 0){
                userInterface.updateCurrentSerie(currentSerie!)

                
            }
            
        
        }
        
        
        
    }
    
    func sliderDidEndRotate() {
        
        if let serie = userInterface.getCurrentSerie() {
            
            let index = userInterface!.getCurrentIndex()!
            addSeriesInteractor.updateSerieForCurrentWorkout(serie.weight, reps: serie.reps,flag:serie.flag, atIndex: index)
            
        }
    
    }
    
    
    
}
