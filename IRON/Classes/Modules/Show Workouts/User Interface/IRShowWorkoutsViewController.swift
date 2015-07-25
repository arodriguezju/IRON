//
//  IRShowWorkoutsViewController.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRShowWorkoutsViewController: UIViewController, IRShowWorkoutsUIInterface {
    
   
   
    @IBOutlet weak var dayUIPicker: IRDayUIPicker!
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
        
        mainCollectionView.weekTableViewEventsDelegate = eventHandler
        eventHandler?.UIDidAppear()
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func displayNewWeeklyDataInCollectionView(data:[IRUIWeekOverviewData]){
    
        
        loadNewDataInCollectionView(data)
        scrollToFirstWeek()        
    
    
    }
    
    func updateDataSourceInCollectionView(data:[IRUIWeekOverviewData]){
    
        mainCollectionView.loadData(data)
    
    }
    
    
    func loadNewDataInCollectionView(data:[IRUIWeekOverviewData]){
    
        updateDataSourceInCollectionView(data)
        mainCollectionView.reloadData()
    
    }
    
    
    
    func showDayPicker(){
    
        var pickerWeekDate = mainCollectionView.getActiveWeek()
        dayUIPicker.configureAndReloadData(pickerWeekDate)
        dayUIPicker.reloadAllComponents()
        dayUIPicker.showPicker()
    
    }
    
    
    func hideDayPicker(){
    
        dayUIPicker.hidePicker()
    
    }
    
    func scrollToFirstWeek(){
        
        let maxScroll = mainCollectionView.numberOfItemsInSection(0)-1
        
        if maxScroll >= 0 {
        
          self.scrollToWeek(atIndex: maxScroll)
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
