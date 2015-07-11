//
//  IRShowWorkoutsUIInterface.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import Foundation


protocol IRShowWorkoutsUIInterface {


    //Updates data, reload the CV and scrolls to last item
    func displayNewWeeklyData(data:[IRUIWeekOverviewData])
    
    //Update data
    func updateData(data:[IRUIWeekOverviewData])
    

}