//
//  IRShowWorkoutsWeekTableView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 18/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit
class IRShowWorkoutsWeekTableView: UITableView{
    
    
    var data : IRUIWeekOverviewData? {
        
        didSet{
            
            sectionNames = data!.sectionNames
            sectionData = data!.sectionData
            
        }
    }
    
    @IBOutlet weak var addDayUIButton: UIButton!
    private var sectionNames: NSOrderedSet?
    private var sectionData:[String:[Any]]?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        
       /* tableHeaderView = UIView(frame: CGRectMake(0,0,100,200))
        tableHeaderView?.backgroundColor=UIColor.blackColor()*/
        
       
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
       addDayUIButton.layer.borderColor = Constants.Colors.mainActiveColor.CGColor
      addDayUIButton.layer.cornerRadius = 5
        addDayUIButton.layer.borderWidth = 1
       
    }
    
}

extension IRShowWorkoutsWeekTableView:UITableViewDelegate,UITableViewDataSource {


    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //TODO Better
        
       if let sectionDataNew = sectionData {
        
        if  let sectionName = sectionNames![section] as? String {
      
        
         return sectionDataNew[sectionName]!.count
        
        }
        
        }
    
        return 0
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let sectionName = sectionNames![indexPath.section] as! String
        let sectionItems  = sectionData![sectionName]!
        
        switch sectionItems[indexPath.item] {
            
            
            
        case is IRUIWeekOverviewExercise :
            
            var cell = self.dequeueReusableCellWithIdentifier(Constants.CellIdentifiers.weekOverviewExerciseTableView, forIndexPath: indexPath) as! IRShowWorkoutsWeekExerciseTableViewCell

            cell.prepareCellForItem(sectionItems[indexPath.item] as! IRUIWeekOverviewExercise)
            return cell
            
            
            
        case is IRUIWeekOverviewSerie:
            
            var cell = self.dequeueReusableCellWithIdentifier(Constants.CellIdentifiers.weekOverviewSerieTableView, forIndexPath: indexPath) as! IRShowWorkoutsWeekSerieTableViewCell
            
            cell.prepareCellForItem(sectionItems[indexPath.item] as! IRUIWeekOverviewSerie)
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
  
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        var outputView = UIView(frame:CGRectMake(0, 0, self.frame.width, 30))
        outputView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.05)
        
        var label = UILabel(frame: CGRectMake(15, 0, self.frame.width-50, 40))
        label.font = UIFont(name:"HelveticaNeue-Light", size: 15.0)
        label.text = sectionNames![section].uppercaseString
        outputView.addSubview(label)
        
        /*var addButton = UIButton(frame: CGRectMake(label.frame.width,0,40,40))
        addButton.setTitle("Add", forState: UIControlState.Normal)
        addButton.setTitleColor(Constants.Colors.mainActiveColor, forState: UIControlState.Normal)
        outputView.addSubview(addButton)*/
        
        return outputView
    
    
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
   
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {

        
        let sectionName = sectionNames![indexPath.section] as! String
        let sectionItems  = sectionData![sectionName]!
        
        switch sectionItems[indexPath.item] {
            
            
        case is IRUIWeekOverviewExercise :
            
            return false
            
        case is IRUIWeekOverviewSerie:
            
            return true
            
        default :
            
            return false
        }
        

    
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let sectionName = sectionNames![indexPath.section] as! String
        
        switch editingStyle {
        
        
            
        case .Delete :
            
            tableView.beginUpdates()
            
            sectionData![sectionName]!.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Left)
            tableView.endUpdates()
            
        default :()
            
            
        
        }
        
        
    }
    

}




