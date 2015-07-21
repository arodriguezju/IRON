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
        
    
    @IBOutlet weak var addDayUIButton: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        
             
    }
    
    @IBAction func addWorkoutToWeekDidClick(sender: AnyObject) {
        
        if let delegate = eventsDelegate {
        
            delegate.addWorkoutToWeekButtonDidClick()
        
        }
        
    }

    
    
    func switchEditing(){
    
        if (self.editing) {
            
            self.setEditing(false, animated: true)
            
        }
        else {
        
            self.setEditing(true, animated: true)
        }
        
        switchHeader(self.editing)
    
    }
    
    func switchHeader(active:Bool){
        
        if let container = addDayUIButton.superview {
            
            let newFrame : CGRect
            
            if (active) {
                newFrame = CGRect(origin: container.frame.origin,size: CGSizeMake(container.frame.size.width, 40))
                container.frame = newFrame

            }
            else{
                newFrame = CGRect(origin: container.frame.origin,size: CGSizeMake(container.frame.size.width, container.frame.size.height*0))
                container.frame = newFrame


            }
            
            
            UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                
                self.tableHeaderView = container
                self.layoutIfNeeded()
                
                
                }
                , completion: nil)
        }
        
        
    
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       addDayUIButton.layer.borderColor = Constants.Colors.mainActiveColor.CGColor
      addDayUIButton.layer.cornerRadius = 5
        addDayUIButton.layer.borderWidth = 1
       
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
        label.font = UIFont(name:"HelveticaNeue-Light", size: 15.0)
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
            
            return true
            
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




