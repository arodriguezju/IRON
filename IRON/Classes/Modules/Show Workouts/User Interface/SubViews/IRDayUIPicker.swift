//
//  IRDayUIPicker.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 12/07/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRDayUIPicker: UIPickerView, UIPickerViewDataSource,UIPickerViewDelegate {

     @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var data:[String]!
    
    func hidePicker(){
    
        bottomConstraint.constant=0-self.frame.size.height
        self.setNeedsUpdateConstraints()
    
    }
    
    
    func showPicker(){
        
        bottomConstraint.constant=0
        self.setNeedsUpdateConstraints()
    
    }
    
    
   required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        var formatter = NSDateFormatter().weekdaySymbols
        data = NSDateFormatter().weekdaySymbols as! [String]
        self.dataSource=self
        self.delegate=self
    
        
    }
    
    override func awakeFromNib() {
        hidePicker()
    }

    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
    
        return 1
    
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
        return data.count
    
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
    
        return data[row]
    
    }
    
  //  optional func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
}
