//
//  IRShowWorkoutsViewController.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRShowWorkoutsViewController: UIViewController, IRShowWorkoutsUIInterface {
    
   
   
  
    @IBOutlet weak var mainCollectionView: IRShowWorkoutsWeekCollectionView!
    
    var eventHandler:IRShowWorkoutsEventHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler?.UIDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func displayWeekData(data:IRUIWeekOverviewData){
    
        
        
        
        
        mainCollectionView.loadData(data)
        mainCollectionView.reloadData()
    
    
    }
    
    @IBAction func addButtonItemDidClick(sender: AnyObject) {
        
        eventHandler!.addButtonItemDidClick()

    }
    
}
