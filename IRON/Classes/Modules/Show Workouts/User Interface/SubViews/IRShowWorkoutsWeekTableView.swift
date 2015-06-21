//
//  IRShowWorkoutsWeekTableView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 18/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit
class IRShowWorkoutsWeekTableView: UITableView{
    
    //var sectionData = ["Monday","Wednesday","Friday"]
    var cellTitle = ["Squats","3 x 45Kg","5 x 50Kg","Bench Press","3 x 45Kg","5 x 50Kg" ]
    var cellTypes = ["Title","Exercise"]
    
    
    var data : IRUIWeekOverviewData? {
        didSet{
        
        sectionNames = data!.sectionNames
        sectionData = data!.sectionData
        }
    }
    private var sectionNames: [String]?
    private var sectionData:[Int:[Any]]?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
       
        
        
    }
    
}

extension IRShowWorkoutsWeekTableView:UITableViewDelegate,UITableViewDataSource {


    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       if let sectionDataNew = sectionData {
        
         return sectionDataNew[section]!.count
        
        
        }
    
        return 0
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let sectionItems  = sectionData![indexPath.section]
        
        switch sectionItems![indexPath.item] {
            
        case is IRUIWeekOverviewExercise :
            
            var cell = self.dequeueReusableCellWithIdentifier(Constants.CellIdentifiers.weekOverviewExerciseTableView, forIndexPath: indexPath) as! IRShowWorkoutsWeekExerciseTableViewCell

            cell.prepareCellForItem(sectionItems![indexPath.item] as! IRUIWeekOverviewExercise)
            return cell
            
        case is IRUIWeekOverviewSerie:
            
            var cell = self.dequeueReusableCellWithIdentifier(Constants.CellIdentifiers.weekOverviewSerieTableView, forIndexPath: indexPath) as! IRShowWorkoutsWeekSerieTableViewCell
            
            cell.prepareCellForItem(sectionItems![indexPath.item] as! IRUIWeekOverviewSerie)
            return cell
        
        default :
            
            return UITableViewCell()
        }

        
        
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if let names = sectionNames {
        
            return names.count
        
        }
        return 0
    
    
    }
    
  /*  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return  sectionData[1]
    
    }*/
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var outputView = UIView(frame:CGRectMake(0, 0, self.frame.width, 30))
        outputView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.05)
     
        
        var label = UILabel(frame: CGRectMake(15, 0, self.frame.width-40, 40))
        label.font = UIFont(name:"HelveticaNeue-Light", size: 15.0)
        label.text = sectionNames![section].uppercaseString
        outputView.addSubview(label)
        
        return outputView
    
    
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
   /* func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
    
    
        return ["Test1","Test2"]
    
    }*/

    

}




