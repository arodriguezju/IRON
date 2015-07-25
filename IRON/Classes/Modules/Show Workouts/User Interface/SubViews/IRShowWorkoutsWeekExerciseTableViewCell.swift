//
//  IRShowWorkoutsWeekTableViewCell.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 18/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRShowWorkoutsWeekExerciseTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var titleUILabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor() 
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
        
        
    }
    
    func prepareCellForItem(item:IRUIWeekOverviewExercise){
    
        self.titleUILabel.text = item.exerciseName
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
    }

}



