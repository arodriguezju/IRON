//
//  Constants.swift
//  ParseStarterProject
//
//  Created by Angel Rodriguez junquera on 31/05/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

struct Constants {
    
    
        
    struct CellIdentifiers {
        static let weekOverview = "weekOverviewCell"
        static let seriesCollectionView = "serieCell"
        static let addSerieCollectionView = "addSerieCellIdentifier"
        static let exerciseSelectionTableView = "exerciseSelectionCellIdentifier"
        static let showWorkoutsCollectionView = "showWorkoutsCollectionCellIdentifier"
         static let weekOverviewExerciseTableView = "weekOverviewExerciseTableViewCell"
        static let weekOverviewSerieTableView = "weekOverviewSerieTableViewCell"




    }
    
    struct Colors {
        static let sliderContainerBackground :UIColor = UIColor(red: 65/255, green: 104/255, blue: 129/255, alpha: 1)
        static let serieCellBackground = UIColor.whiteColor()
        static let serieCellInactiveLabel = UIColor.blackColor().colorWithAlphaComponent(0.5)
        static let serieCellActiveLabel = UIColor.blackColor()
        static let mainActiveColor = UIColor(red: 225/255, green: 73/255, blue: 56/255, alpha: 1)
        static let flagRedColor = UIColor(red: 184/255, green: 49/255, blue: 47/255, alpha: 1)
        static let flagYellowColor = UIColor(red: 250/255, green: 197/255, blue: 28/255, alpha: 1)
        static let flagGreenColor = UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1)

  
   }
    
    struct Fonts {
        static let serieCellInactiveLabel = UIFont(name:"HelveticaNeue-Regular", size: 22.0)
        static let serieCellActiveLabel = UIFont(name:"HelveticaNeue-Regular", size: 22.0)
        
    
    
    
    }
    
    enum SliderDirection : NSInteger  {
        case Clockwise = 1
        case CounterClockwise = 0
        
    }
    
    enum WeightUnits : String {
        case Kilograms = "Kg"
        case Pounds = "Lbs"
        
   }
    
    enum FlagType: Int {
        
        case Easy = 1
        case Normal = 2
        case Hard = 3
    
}
    
    enum WorkoutToDoOperations: Int {
    
        case deleteExercise = 1
        case deleteDay = 2

    }
    

}