//
//  IRShowWorkoutsPresenter.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation

class IRShowWorkoutsPresenter: NSObject , IRShowWorkoutsEventHandler, IRShowWorkoutsInteractorOutput  {
    
    var userInterface:IRShowWorkoutsUIInterface?
    var showWorkoutsInteractor : IRShowWorkoutsInteractorInput?
    var showWorkoutsWireframe: IRShowWorkoutsWireframe?
    
    
    
    func UIDidLoad(){
        
      //  showWorkoutsInteractor!.findWorkouts()
        
        
    }
    
    func UIDidAppear(){
        
        showWorkoutsInteractor!.findWorkouts({ rawItem in
            
            self.userInterface!.displayNewWeeklyDataInCollectionView(self.prepareRawDataForUI(rawItem as [IRRawWorkout]))
            
                      
        })
        
    }
    
    
   /* func foundWorkouts(workouts:[IRRawWorkout]){
        
        userInterface!.displayNewWeeklyData(prepareRawDataForUI(workouts))
        
        
    }*/
    
    
    func prepareRawDataForUI(workouts:[IRRawWorkout])->[IRUIWeekOverviewData] {
        
        
        
        var dataByWeek :[String:IRUIWeekOverviewData] = [:]
        
        
        
        var weeks : [String:IRUIWeekOverviewData] = [:]
        for workout in workouts {
            
            let weekName = "\(workout.dateAdded.getWeekName()) - \(workout.dateAdded.getFirstDayOfWeekDateString())"
            let dayName = workout.dateAdded.getDayName()
            let firstDayOfWeek = workout.dateAdded.getFirstDayOfWeekDate()
            
            if ( weeks[weekName] == nil ) {
                
                weeks[weekName] = IRUIWeekOverviewData(weekTitle:weekName,weekDate:firstDayOfWeek,sectionNames:[],sectionData:[:])
                
            }
            
            if ( weeks[weekName]!.sectionData[dayName] == nil ) {
                
                weeks[weekName]!.sectionData[dayName] = []
                
            }
            
            weeks[weekName]!.sectionNames.addObject(dayName)
            
            let exercise = IRUIWeekOverviewExercise(exerciseName:workout.exerciseName,exerciseAddedDate:workout.dateAdded)
            weeks[weekName]!.sectionData[dayName]!.append(exercise)
            
            
            var i = 0
            for serie in workout.series {
                
                weeks[weekName]!.sectionData[dayName]!.append(IRUIWeekOverviewSerie(weight:serie.weight, reps: serie.reps, flag: serie.flag, index:i,exercise:exercise))
                i++
            }
            
            
            
            
        }
        
        return weeks.values.array
        
    }
    
    
    
    
    func addButtonItemDidClick() {
        
        showWorkoutsWireframe!.addButtonItemDidClik()
        
    }
    
    func exerciseDidClick(exercise:IRUIWeekOverviewExercise) {
    
        showWorkoutsWireframe!.exerciseDidClick(exercise.exerciseAddedDate)
    
    }
    
    func deleteSerieDidClick(exercise:IRUIWeekOverviewExercise, atIndex index:Int,completion:(error:NSError?)-> Void)
    {
        
        showWorkoutsInteractor!.deleteSerie(atIndex: index, forExerciseAtDate: exercise.exerciseAddedDate
            ,completion:{
        
                error in
                
                if let error = error {
                
                
                }
                else{
                    
                    completion(error: error)
                    self.updateDataOfVisibleWeek()
                    
                }
        
        })        

    
    }
    
    func addWorkoutToWeekButtonDidClick() {
    
        userInterface!.showDayPicker()
    
    }
    
    func serieDeleted(inWorkout workout:IRRawWorkout, atIndex index:Int) {
    
        
       /* userInterface!.deleteSerieInWorkout(atDate:workout.dateAdded, atIndex:index)
        
        showWorkoutsInteractor!.findWorkouts({ rawItem in
            
            self.userInterface!.updateDataSource(self.prepareRawDataForUI(rawItem as [IRRawWorkout]))
            
        })*/
    
    }

    func updateDataOfVisibleWeek(){
    
        showWorkoutsInteractor!.findWorkouts({ rawItem in
            
            
            self.userInterface!.loadNewDataInCollectionView(self.prepareRawDataForUI(rawItem as [IRRawWorkout]))
    
    })
    }
    
}
