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
  
    
     override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler!.UIDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configureViewController()
    }

    func configureViewController(){
    
    
        
        exerciseSelectionTableView.tableViewDelegate = eventHandler
        
                   //button.backgroundColor = Constants.Colors.mainActiveColor
        
        
        var backItem =  UIBarButtonItem(customView: getBackButton())
        navigationItem.leftBarButtonItem = backItem
        navigationItem.leftBarButtonItem?.tintColor = Constants.Colors.mainActiveColor
       
       /* let backItem = UIBarButtonItem(title: "Custom", style: .Bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        NSLog ("\(navigationItem.backBarButtonItem!.title)")*/
    
    }
    
    func getBackButton()->UIButton {
        
        var button = UIButton()
        button.setImage(UIImage(named: "backbtn.png"), forState: UIControlState.Normal)
        button.frame = CGRectMake(0,0,10,20)
        button.addTarget(self, action: "didBackItemClick", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    
    }
    
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
    
   
    

}
