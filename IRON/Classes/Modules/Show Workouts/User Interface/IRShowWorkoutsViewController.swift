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
        
        self.navigationItem.leftBarButtonItem?.title
        
        mainCollectionView.weekTableViewDelegate = eventHandler
        eventHandler?.UIDidAppear()
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func displayNewWeeklyData(data:[IRUIWeekOverviewData]){
    
        
        mainCollectionView.loadData(data)
        mainCollectionView.reloadData()
        scrollToFirstWeek()        
    
    
    }
    
    func updateData(data:[IRUIWeekOverviewData]){
    
        mainCollectionView.loadData(data)
    
    }
    
    func scrollToFirstWeek(){
        
        let maxScroll = mainCollectionView.numberOfItemsInSection(0)-1
        
        if maxScroll >= 0 {
        
          self.scrollToWeek(atIndex: mainCollectionView.numberOfItemsInSection(0)-1)
        }
        
        
    }
    
    func scrollToWeek(atIndex index:Int){
        
        mainCollectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: index, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
    }
    
    
    @IBAction func addButtonItemDidClick(sender: AnyObject) {
        
        eventHandler!.addButtonItemDidClick()

    }
    
    @IBAction func editWeekButtonDidClick(sender: AnyObject) {
        
        if mainCollectionView.visibleCells().count > 0 {
            
            let cell = mainCollectionView.visibleCells()[0] as! IRShowWorkoutsWeekCollectionViewCell
            cell.weekTableView.switchEditing()
            
        }
        
    }
    
}
