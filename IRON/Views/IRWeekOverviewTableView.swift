//
//  IRWeekOverviewTableView.swift
//  ParseStarterProject
//
//  Created by Angel Rodriguez junquera on 31/05/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class IRWeekOverviewTableView: UITableView  {

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
    }
    
}

extension IRWeekOverviewTableView : UITableViewDataSource{

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return 3;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell : IRWeekOverviewTableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.CellIdentifiers.weekOverview, forIndexPath: indexPath) as! IRWeekOverviewTableViewCell
        
        cell.dateLabel.text = "TestDate"
        
        return cell
    
    
    }
    
}

extension IRWeekOverviewTableView : UITableViewDelegate{


}

