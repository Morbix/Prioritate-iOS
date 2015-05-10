//
//  PRNewItemViewController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 06/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PRItemDetailViewController: UITableViewController {

    @IBOutlet var textFieldPrice: TSCurrencyTextField!
    @IBOutlet var textFieldName: UITextField!
    
    static func getInstance() -> UIViewController {
        let storyboard = UIStoryboard(name: "ItemDetail", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UIViewController
    }
    
    override func viewDidLoad() {
        if let item = PRDataManager.sharedInstance.selectedItem {
            self.textFieldName.text = item.name
            self.textFieldPrice.amount = item.price.numberValue
        }
    }
    
    // MARK: Methods
    func closeModal() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func editCurrentItemWith(title: String, price:Float){
        if let item: PFItem = PRDataManager.sharedInstance.selectedItem {
            item.name = title
            item.price = price
        }else{
            let item: PFItem = PFItem(name: title, price: price)
            PRDataManager.sharedInstance.itemsArray.append(item)
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName(NOTIFICATION_NEW_ITEM, object: nil)
    }
    
    // MARK: Actions
    @IBAction func barButtonCancelTouched(sender: AnyObject) {
        self.closeModal()
    }
    
    @IBAction func barButtonSaveTouched(sender: AnyObject) {
        self.editCurrentItemWith(self.textFieldName.text,
            price: self.textFieldPrice.amount.floatValue)
        self.closeModal()
    }
    
    // MARK: UITableViewDelegate and UITableViewDataSource
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
}
