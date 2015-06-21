//
//  IRShowWorkoutsWeekCollectionViewCell.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRShowWorkoutsWeekCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var weekCollectionView: IRShowWorkoutsWeekTableView!
    @IBOutlet weak var weekUILabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        self.backgroundColor = UIColor.clearColor()
    }
    
    
    func prepareCell(){
    
        weekUILabel.textColor = Constants.Colors.mainActiveColor
        weekCollectionView.reloadData()
    
    }
    
    
    
}

