//
//  IRSeriesCollectionView.swift
//  IRON
//
//  Created by Angel Rodriguez junquera on 02/06/15.
//  Copyright (c) 2015 arodriguez.es. All rights reserved.
//

import UIKit


protocol IRSeriesCollectionViewDelegate {

    func seriesCollectionViewCellDidClick(index:Int)
    



}

class IRSeriesCollectionView: UICollectionView {
    
    
    
    
    var sliderCollectionViewDelegate : IRSeriesCollectionViewDelegate?
    private var separatorWidth : CGFloat = 0
    private var selectedIndex = NSIndexPath(forItem: 0, inSection: 0)
    var currentSeries:[IRUISerie]? {
        didSet{
        
            self.reloadData()
        
        }
    
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate=self
        self.dataSource=self
       //self.backgroundColor=UIColor.redColor()
    }
    
    
    func selectIndex(index:Int){
        
        
        if( index != selectedIndex.item) {
            
            selectedIndex = NSIndexPath(forItem: index, inSection: 0)
            reloadData()
        }
    
    
    }
    
    
   
}

extension IRSeriesCollectionView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
                let width :CGFloat = self.frame.size.width / 4 
        
       
        return CGSizeMake(width, width)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        if let delegate = sliderCollectionViewDelegate {
        
            delegate.seriesCollectionViewCellDidClick(indexPath.item)
        
        }
        
        
        
    
        
    }
   




}

extension IRSeriesCollectionView:UICollectionViewDataSource{

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let series = currentSeries { return currentSeries!.count + 1 }
        
        return 1
        
        }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if ( indexPath.item + 1 == collectionView.numberOfItemsInSection(0)) {
            
             var cell  = self.dequeueReusableCellWithReuseIdentifier(Constants.CellIdentifiers.addSerieCollectionView, forIndexPath: indexPath) as! UICollectionViewCell
            
            return cell
        
        }
    
        var cell: IRSeriesCollectionViewCell = self.dequeueReusableCellWithReuseIdentifier(Constants.CellIdentifiers.seriesCollectionView, forIndexPath: indexPath) as! IRSeriesCollectionViewCell
     
                
        cell.prepareCellForItem(currentSeries![indexPath.item])
        
        if (indexPath == selectedIndex) {
         cell.active=true
        }
        else{
            cell.active=false
        }
        
       // NSLog("CEll esta active  \(cell.active)")
        
                
        return cell
        

    }

    


}
