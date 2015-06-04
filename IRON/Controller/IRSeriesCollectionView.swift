//
//  IRSeriesCollectionView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 02/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit

class IRSeriesCollectionView: UICollectionView {
    
    
    private var separatorWidth : CGFloat = 1.24999
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate=self
        self.dataSource=self
        self.backgroundColor=UIColor.blackColor().colorWithAlphaComponent(0.1)
        
    }
    
    
   
}

extension IRSeriesCollectionView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
                let width :CGFloat = self.frame.size.width / 4 - separatorWidth
        
        NSLog("Separator\(width)  \(self.frame.size.width / 4)")

        return CGSizeMake(width, width)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(1, 1, 1, 1)
    }

    
    




}

extension IRSeriesCollectionView:UICollectionViewDataSource{

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    
    
    
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        var cell: IRSeriesCollectionViewCell = self.dequeueReusableCellWithReuseIdentifier(Constants.CellIdentifiers.seriesCollectionView, forIndexPath: indexPath) as! IRSeriesCollectionViewCell
        
        
        return cell
        

    }



}
