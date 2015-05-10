//
//  PREditorViewController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 03/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit


class PREditorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itemsArray: [PFItem] = []
    var itemEditing: PFItem?
    var textFieldNewItemTitle: UITextField?
    var textFieldNewItemPrice: UITextField?
    
    var needReload: Bool = true
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setUp()
    }
    
    override func viewWillAppear(animated: Bool) {
        if needReload {
            needReload = false
            self.reloadAllData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Methods
    func setUp(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("notificationNewItem:"), name: NOTIFICATION_NEW_ITEM, object: nil)
    }
    
    func reloadAllData() {
        itemsArray = []
        itemsArray += PRDataManager.sharedInstance.itemsArray
        table.reloadData()
    }
    
    func presentItemDetail() {
        self.presentViewController(PRItemDetailViewController.getInstance(), animated: true, completion: nil)
    }
    
    //MARK: - Actions
    @IBAction func barButtonAddTouched(sender: AnyObject) {
        PRDataManager.sharedInstance.selectedItem = nil
        self.presentItemDetail()
    }
    
    //MARK: - Notifications
    func notificationNewItem(notification: NSNotification){
        self.needReload = true
    }
    
    //MARK: - UITableViewDelegate and UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var identifier: String = CELL_ITEM_EDITOR
        var object: AnyObject?
        
        object = itemsArray[indexPath.row]
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier,
            forIndexPath: indexPath) as! UITableViewCell
        
        if let cellProtocol = cell as? MXCellProtocol{
            cellProtocol.mx_configureCell(object, target: self, indexPath: indexPath)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var object: PFItem = itemsArray[indexPath.row]
        PRDataManager.sharedInstance.selectedItem = object
        self.presentItemDetail()
    }
}
