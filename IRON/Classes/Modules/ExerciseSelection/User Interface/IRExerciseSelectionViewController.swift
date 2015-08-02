//
//  IRExerciseSelectionViewController.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 14/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRExerciseSelectionViewController: UIViewController,IRExerciseSelectionUIInterface {
    
    var eventHandler : IRExerciseSelectionEventHandler?
    
    private var exercisesByGroup:Dictionary<String, Array<IRUIExercise>>?

    @IBOutlet weak var exerciseSelectionTableView: IRExerciseSelectionTableView!
    @IBOutlet weak var timeUIPicker: UIDatePicker!
    @IBOutlet weak var timePickerViewContainer: UIView!{
        didSet {
            
            timePickerViewContainer.alpha = 0
            
        }
        
    }

    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler!.UIDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        exerciseSelectionTableView.tableViewDelegate = eventHandler
    }

   
    
   /* func getBackButton()->UIButton {
        
        var button = UIButton()
        button.setImage(UIImage(named: "backbtn.png"), forState: UIControlState.Normal)
        button.frame = CGRectMake(0,0,10,20)
        button.addTarget(self, action: "didBackItemClick", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    
    }*/
    
    func didBackItemClick(){
        
        eventHandler?.backButtonDidClick()
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateAndDisplayGroupsData(data: Dictionary<String, Array<IRUIExercise>>) {
        
        exercisesByGroup = data
        self.displayCurrentGroupData()
        
        
    }
    
    func displayCurrentGroupData(){
    
        
        exerciseSelectionTableView.data = exercisesByGroup!.keys.array
        
    
    }
    
    func displayExercisesFromGroup(index:Int){
        
        if let exercisesByGroup = exercisesByGroup {
        
            let key = exercisesByGroup.keys.array[index]
            var exercisesArray:[String] = []
            
            for exercise in exercisesByGroup[key]! {
                
                exercisesArray.append(exercise.exerciseName)
                
            }
            exerciseSelectionTableView.data = exercisesArray
        
        }
    
    
    }
    
    func setTimePicker(#enabled:Bool, withDate:NSDate){
        
                
            timePickerViewContainer.alpha = CGFloat(enabled.hashValue)
        
    
    }
    
    func setTimePicker(#date:NSDate) {
        
        timePickerViewContainer.alpha = 1
        
        
        timeUIPicker.setDate(date, animated: true)
        
    
    }

    
    
    func getDateFromPicker()->NSDate?{
               
        if (timePickerViewContainer.alpha == 1) {
        return timeUIPicker.date
        }
        else{
            return nil
        }
    
    }
    

}
