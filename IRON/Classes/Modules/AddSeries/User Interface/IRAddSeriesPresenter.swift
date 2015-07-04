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
                    serie.flag = getNewFlagForSerie(serie)
                   
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
    
    func getNewFlagForSerie(serie:IRUISerie)->Constants.FlagType{
    
        if ( serie.flag == Constants.FlagType.Hard) {
            return Constants.FlagType.Easy
        }
        else
        {
            
        return Constants.FlagType(rawValue: serie.flag.rawValue + 1)!
        }
        
    
    }

    
    func foundNewWorkout(workout:IRRawWorkout){
        
        let workoutUIReady = prepareRawDataForUI(workout)
        userInterface.setCurrentWorkout(workoutUIReady)
        userInterface.setCurrentSerie(atIndex: 0)
        
       
    }
    
    func foundNewSerie(serie: IRRawSerie) {
        let serieUI = prepareRawDataForUI(serie)
        
        userInterface.addSerie(serieUI)
        userInterface.setLastSerieAsCurrentSerie()
    
    }
    
    
    func UIDidLoad(){
        
        
            addSeriesInteractor.findNewWorkoutWithExerciseName(userInterface.getCurrentExercise())
    
    }
    
    
    func prepareRawDataForUI(workout:IRRawWorkout)->IRUIWorkout{
    
        var workoutOutput : IRUIWorkout = IRUIWorkout()
        workoutOutput.date = workout.dateAdded
        
        for serie in workout.series {
            
            workoutOutput.series.append(self.prepareRawDataForUI(serie))
        
        }
       
        return workoutOutput
    
    }
    
    
    func prepareRawDataForUI(serie:IRRawSerie) -> IRUISerie{
        
        var serieOutput : IRUISerie = IRUISerie(weight: serie.weight, reps: serie.reps, flag: serie.flag)
       
        return serieOutput
        
        
    }
    
    func prepareUIDataToRaw(serie:IRUISerie) -> IRRawSerie{
        
        var serieOutput : IRRawSerie = IRRawSerie(weight: serie.weight, reps: serie.reps, flag: serie.flag)
        
        return serieOutput
        
        
    }

    
    /*func prepareUIDataForInteractor(workout:IRUIWorkout)->IRRawWorkout{
        
        var workoutOutput : IRRawWorkout = IRRawWorkout(dateAdded:workout.date, series:[],exerciseName:workout.exerciseName)
        
        
        for serie in workout.series {
            
            
            workoutOutput.series.append(self.prepareUIDataForInteractor(serie))
            
        }
        
        return workoutOutput
        
    }
    
    
    func prepareUIDataForInteractor(serie:IRUISerie) -> IRRawSerie{
        
        var serieOutput : IRRawSerie = IRRawSerie(weight: serie.weight, reps: serie.reps, flag: serie.flag)
        
        return serieOutput
        
        
    }*/
    
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
            
            let rawSerie = self.prepareUIDataToRaw(serie)
            let index = userInterface!.getCurrentIndex()!
            
            addSeriesInteractor!.updateSerie(rawSerie, atIndex: index)
            
        }
    
    }
    
    
    
}
