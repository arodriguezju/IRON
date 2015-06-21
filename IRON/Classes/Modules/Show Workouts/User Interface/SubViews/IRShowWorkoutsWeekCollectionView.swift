//
//  IRShowWorkoutsWeekCollectionView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 17/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit
class IRShowWorkoutsWeekCollectionView: UICollectionView{
    
    var data :IRUIWeekOverviewData?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        
        
    }
    
    func loadData(data:IRUIWeekOverviewData) {
    
        self.data=data
    }

}

extension IRShowWorkoutsWeekCollectionView: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {



    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 3
    
    
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        var cell = self.dequeueReusableCellWithReuseIdentifier(Constants.CellIdentifiers.showWorkoutsCollectionView , forIndexPath:indexPath ) as! IRShowWorkoutsWeekCollectionViewCell
        cell.prepareCell()
        if let data = data {
        cell.weekCollectionView.data = self.data!
        
        }
        
        return cell
    
    
    }

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
       return self.frame.size
      //  return CGSizeMake(self.frame.width-5,self.frame.height-60)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0,0,0,0)
    }
    


}



