//
//  IRShowWorkoutsWeekTableView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 18/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

protocol IRShowWorkoutsWeekTableViewEventsDelegate{
    
    
    func exerciseDidClick(exercise:IRUIWeekOverviewExercise)
    func serieDidClick(eserie:IRUIWeekOverviewSerie)

    func deleteSerieDidClick(exercise:IRUIWeekOverviewExercise, atIndex index:Int, completion:(error:NSError?)-> Void)
    func addWorkoutToWeekButtonDidClick()
    

}

protocol IRShowWorkoutsWeekTableViewDatasourceDelegate{
    
      
    func dataDidChange(data:[IRUIWeekOverviewData])
    func getData()->[IRUIWeekOverviewData]?
    
    
    
}
class IRShowWorkoutsWeekTableView: UITableView{
    
    var eventsDelegate:IRShowWorkoutsWeekTableViewEventsDelegate?
    var dataSourceDelegate: IRShowWorkoutsWeekTableViewDatasourceDelegate?
   // var data :[IRUIWeekOverviewData]?
  
    
    var indexAtCollectionView:Int?
        
    
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        
             
    }
    
   

    
    
    func switchEditing(){
    
        if (self.editing) {
            
            self.setEditing(false, animated: true)
            
        }
        else {
        
            self.setEditing(true, animated: true)
        }
        
       
    
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
             
    }
    
}

extension IRShowWorkoutsWeekTableView:UITableViewDelegate,UITableViewDataSource {


    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if let sectionNames = getSectionNames() {
        
        
            if let sectionsData = getSectionsData() {
                
                let sectionName = sectionNames[section]
                let sectionData = sectionsData[sectionName]!
                
                return sectionData.count
            }
        
        
        }
        
        return 0
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let sectionData = getSectionDataAtSection(indexPath.section)

        
        switch sectionData[indexPath.item] {
            
            
        case is IRUIWeekOverviewExercise :
            
            var cell = self.dequeueReusableCellWithIdentifier(Constants.CellIdentifiers.weekOverviewExerciseTableView, forIndexPath: indexPath) as! IRShowWorkoutsWeekExerciseTableViewCell

            cell.prepareCellForItem(sectionData[indexPath.item] as! IRUIWeekOverviewExercise)
            return cell
            
            
            
        case is IRUIWeekOverviewSerie:
            
            var cell = self.dequeueReusableCellWithIdentifier(Constants.CellIdentifiers.weekOverviewSerieTableView, forIndexPath: indexPath) as! IRShowWorkoutsWeekSerieTableViewCell
            
            cell.prepareCellForItem(sectionData[indexPath.item] as! IRUIWeekOverviewSerie)
            return cell
            
        
        default :
            
            return UITableViewCell()
        }

        
        
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if let sectionNames = getSectionNames() {
            return sectionNames.count
        }
        return 0
        
        
    }
  
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        var outputView = UIView(frame:CGRectMake(0, 0, self.frame.width, 30))
        outputView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.05)
        
        var label = UILabel(frame: CGRectMake(15, 0, self.frame.width-50, 40))
        label.font = Constants.Fonts.sectionWeekOverview!
        label.text = getSectionNames()![section].uppercaseString
        
        outputView.addSubview(label)
        
        
        return outputView
    
    
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
   
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
       
        let sectionData = getSectionDataAtSection(indexPath.section)

        
        switch sectionData[indexPath.item] {
            
            
        case is IRUIWeekOverviewExercise:
            
            return false
            
        case is IRUIWeekOverviewSerie:
            
            return self.editing
            
        default :
            
            return false
        }
        

    
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
       
        let sectionData = getSectionDataAtSection(indexPath.section)

        
        switch editingStyle {
            
            case .Delete :
                
                               
                CATransaction.begin()
                
                CATransaction.setCompletionBlock({
                
                if let delegate = self.eventsDelegate{
                    
                        
                    let serie = sectionData[indexPath.item] as! IRUIWeekOverviewSerie
                    
                    delegate.deleteSerieDidClick(serie.exercise, atIndex: serie.index, completion: {
                    
                        error in
                        
                        CATransaction.begin()
                        tableView.beginUpdates()
                        self.deleteDataSourceItemAtIndexPath(indexPath)
                        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Left)
                        tableView.endUpdates()
                        CATransaction.commit()
                        
                        
                        
                    })
                    
                 }
                
               })
            
            
            
            
            
            
            default :()
            
        
        }
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let sectionData = getSectionDataAtSection(indexPath.section)
        
        switch sectionData[indexPath.item] {
            
            
        case is IRUIWeekOverviewExercise:
            
            if let delegate = self.eventsDelegate {
            
                delegate.exerciseDidClick(sectionData[indexPath.item] as! IRUIWeekOverviewExercise)
            
            }
            
          
         case is IRUIWeekOverviewSerie:
            
            if let delegate = self.eventsDelegate {
                
                delegate.serieDidClick(sectionData[indexPath.item] as! IRUIWeekOverviewSerie)
                
            }

        default :()
            
            
        }
    
    }
    
    
    func getSectionsData()->[String:[Any]]?
    {
        
        
        if let delegate = self.dataSourceDelegate {
            
            if let data = delegate.getData() {
            
            if let index = indexAtCollectionView {
                
                return data[index].sectionData
                
            }
            
        }
        }
        return nil
    
    }
    
    func getSectionNames()->[String]?
    {
        
        if let delegate = self.dataSourceDelegate {
        
        if let data = delegate.getData() {
            
            if let index = indexAtCollectionView {
                
                return data[index].sectionNames.array as? [String]
                
            }
            
        }
        }
        return nil
        
    }
    
    func getSectionDataAtSection(section:Int)->[Any] {
    
        let sectionName = getSectionNames()![section]
        let sectionData = getSectionsData()![sectionName]
        return sectionData!
    
    }
    
    
    func deleteDataSourceItemAtIndexPath(indexPath:NSIndexPath) {
    
        if let delegate = self.dataSourceDelegate {
            
       var data = delegate.getData()!
       var tableViewData = data[indexAtCollectionView!]
       let sectionName = getSectionNames()![indexPath.section]
       var sectionData = getSectionsData()![sectionName]
        
        sectionData!.removeAtIndex(indexPath.row)
        tableViewData.sectionData[sectionName] = sectionData
        data[indexAtCollectionView!] = tableViewData
        delegate.dataDidChange(data)
        
        
        
        }
        
       
    
    }
    

}




