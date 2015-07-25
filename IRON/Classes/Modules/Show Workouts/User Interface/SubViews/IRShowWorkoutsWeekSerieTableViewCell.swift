//
//  IRShowWorkoutsSerieTableViewCell.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 20/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRShowWorkoutsWeekSerieTableViewCell: UITableViewCell {

    @IBOutlet weak var flagUIView: FlagUIView!
        @IBOutlet weak var titleUILabel: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
        flagUIView.addFlagLayer()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func prepareCellForItem(item:IRUIWeekOverviewSerie){
        
        let weightUnit :String = NSUserDefaults.standardUserDefaults().stringForKey("weightUnit")!
        
        self.titleUILabel.text = "\(item.reps) x \(item.weight) \(weightUnit) "
       flagUIView.setFlag(item.flag)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None

    }
    
        
}
