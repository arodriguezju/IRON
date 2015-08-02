//
//  IRExerciseSelectionTableView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

protocol IRExerciseSelectionTableViewDelegate {

    func exerciseSelectionTableViewDidClick(index:Int, item:String)

}

class IRExerciseSelectionTableView: UITableView {
    
    
    var tableViewDelegate:IRExerciseSelectionTableViewDelegate?
    
    var data : [String]=[] {
        
        didSet
        {
                //self.reloadData()
                self.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Left)
        }
    
    }

    @IBOutlet weak var titleLabel: UILabel!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
   required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
    }

}

extension IRExerciseSelectionTableView:UITableViewDataSource,UITableViewDelegate
{
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    

    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = self.dequeueReusableCellWithIdentifier(Constants.CellIdentifiers.exerciseSelectionTableView, forIndexPath: indexPath) as! IRExerciseSelectionTableViewCell
        
        cell.prepareCell()
        cell.titleLabel.text = data[indexPath.item]
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        if let delegate = tableViewDelegate {
            
            delegate.exerciseSelectionTableViewDidClick(indexPath.item, item: data[indexPath.item])
        
        
        }
        
    }



}
