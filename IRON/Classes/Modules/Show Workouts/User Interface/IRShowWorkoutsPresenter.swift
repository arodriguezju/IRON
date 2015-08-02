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
    
    
 
    
    
    func prepareRawDataForUI(workouts:[IRRawWorkout])->[IRUIWeekOverviewData] {
        
        
        
        var dataByWeek :[String:IRUIWeekOverviewData] = [:]
        
        
        
        var weeks : [String:IRUIWeekOverviewData] = [:]
        for workout in workouts {
            
          
            
            let weekName = "\(workout.dateWorkout.getLocalWeekName())  \(workout.dateWorkout.getLocalFirstDayOfWeekDateString())"
            let dayName = workout.dateWorkout.getLocalDayName()
            let firstDayOfWeek = workout.dateWorkout.getLocalFirstDayOfWeekDate()
            
            if ( weeks[weekName] == nil ) {
                
                
                var weekData = IRUIWeekOverviewData(weekTitle:weekName,weekUTCDate:firstDayOfWeek,sectionNames:[],sectionData:[:],sectionUTCDates:[:])
                
                weekData.addAllDaysOfTheWeek(untilToday: true)
                weeks[weekName]=weekData
                
            }
            
            
            
            let exercise = IRUIWeekOverviewExercise(exerciseName:workout.exerciseName,exerciseAddedDate:workout.dateAdded, exerciseDate:workout.dateWorkout)
            weeks[weekName]!.sectionData[dayName]!.append(exercise)
            
            
            var i = 0
            for serie in workout.series {
                var serieWeight = serie.weight
                let weight = serieWeight.preferredWeightForUser
                let units = IRRawWeight.preferredUnitForUser
                weeks[weekName]!.sectionData[dayName]!.append(IRUIWeekOverviewSerie(weight:weight, weightUnit:units, reps: serie.reps, flag: serie.flag, index:i,exercise:exercise))
                i++
            }
            
            
        }
        
        var outputArray=weeks.values.array as [IRUIWeekOverviewData]
        
        
         outputArray.sort({
            
            (s1 : IRUIWeekOverviewData, s2 : IRUIWeekOverviewData) -> Bool in
            return s1.weekUTCDate.compare(s2.weekUTCDate) == NSComparisonResult.OrderedAscending
        })
        
        return outputArray
        
    }
    
    
    
    
    func addButtonItemDidClick() {
        
        showWorkoutsWireframe!.addButtonItemDidClik()
        
    }
    
    func exerciseDidClick(exercise:IRUIWeekOverviewExercise) {
    
        showWorkoutsWireframe!.workoutDidClick(exercise)
    
    }
    
    func serieDidClick(serie:IRUIWeekOverviewSerie)
    {
        
        
        showWorkoutsWireframe!.workoutDidClick(serie.exercise)

    
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
    
    
    
    
    func addButtonInSectionDidClick(#sectionName:String, sectionIndex:Int, sectionDate:NSDate) {
        
        
        showWorkoutsWireframe?.addButtonInSectionDidClick(sectionDate)
        
        
    }


}
