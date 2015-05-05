//
//  PREditorViewController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 03/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit


class PREditorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {
    
    var itensArray: [PFItem] = []
    var itemEditing: PFItem?
    
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
        itensArray = []
        itensArray += PRDataManager.sharedInstance.itensArray
        table.reloadData()
    }
    
    func editCurrentItemWith(title: String){
        if let item: PFItem = itemEditing {
            item.name = title
        }else{
            let item: PFItem = PFItem(name: title)
            PRDataManager.sharedInstance.addNewItem(item)
        }
    }
    
    func showNewItemAlert(){        
        let alertView = UIAlertView(title: "New Item",
            message: "Enter the title of this new item",
            delegate: self,
            cancelButtonTitle: "Cancel",
            otherButtonTitles: "Save")
        alertView.alertViewStyle = .PlainTextInput
        alertView.show()
    }
    
    //MARK: - Actions
    @IBAction func barButtonAddTouched(sender: AnyObject) {
        showNewItemAlert()
    }
    
    //MARK: - Notifications
    func notificationNewItem(notification: NSNotification){
        self.needReload = true
    }
    
    //MARK: - UITableViewDelegate and UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itensArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var identifier: String = CELL_ITEM_EDITOR
        var object: AnyObject?
        
        object = itensArray[indexPath.row]
        
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
    
    //MARK: - UIAlertViewDelegate
    func alertViewShouldEnableFirstOtherButton(alertView: UIAlertView) -> Bool {
        if alertView.alertViewStyle == UIAlertViewStyle.PlainTextInput {
            let textField = alertView.textFieldAtIndex(0)!
            return !textField.text.isEmpty
        }
        
        return true
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 && alertView.alertViewStyle == UIAlertViewStyle.PlainTextInput {
            let textField = alertView.textFieldAtIndex(0)!
            
            editCurrentItemWith(textField.text)
        }
    }
}
