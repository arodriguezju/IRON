//
//  IRShowWorkoutsWeekSelectionTableViewCell.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 30/07/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit
protocol IRShowWorkoutsWeekSectionViewDelegate{

    func addButtonDidClick(sectionIndex index:Int)


}

class IRShowWorkoutsWeekSectionView
: UIView{
    
   
    @IBOutlet weak var dayOfWeekUILabel: UILabel!
    
    @IBOutlet weak var addWorkoutUIButton: UIButton!
    
    private var sectionName:String?
    private var sectionIndex:Int?
    
    var delegate :IRShowWorkoutsWeekSectionViewDelegate?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
    
    }
    
    
    func configureSection(sectionName:String, sectionIndex:Int){
    
    
            dayOfWeekUILabel.text = sectionName
            addWorkoutUIButton.tag = sectionIndex
        
            self.sectionName = sectionName
            self.sectionIndex = sectionIndex
        
                
    }
    
    
    
    @IBAction func addButtonDidClick(sender: UIButton) {
        
        
        delegate?.addButtonDidClick(sectionIndex: self.sectionIndex!)
    }
    
    
}
