//
//  PRNewItemViewController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 06/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PRItemDetailViewController: UITableViewController {

    static func getInstance() -> UIViewController {
        let storyboard = UIStoryboard(name: "ItemDetail", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UIViewController
    }
    
    // MARK: Methods
    func closeModal() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Actions
    @IBAction func barButtonCancelTouched(sender: AnyObject) {
        
        self.closeModal()
    }
    
    @IBAction func barButtonSaveTouched(sender: AnyObject) {
        
        self.closeModal()
    }
    
    // MARK: UITableViewDelegate and UITableViewDataSource
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
}
