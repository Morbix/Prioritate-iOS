//
//  PREditorViewController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 03/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit


class PREditorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itensArray: [PFItem] = []
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
        itensArray = []
        itensArray += PRDataManager.sharedInstance.itensArray
        table.reloadData()
    }
    
    func editCurrentItemWith(title: String, price:String){
        if let item: PFItem = itemEditing {
            item.name = title
        }else{
            let item: PFItem = PFItem(name: title, price: price.floatValue)
            PRDataManager.sharedInstance.addNewItem(item)
        }
    }
    
    func showNewItemAlert(){
        
        let cancelAction = DAAlertAction(title: "Cancel",
            style: DAAlertActionStyle.Cancel,
            handler: nil)
        
        let saveAction = DAAlertAction(title: "Save",
            style: DAAlertActionStyle.Default) { () -> Void in
                self.editCurrentItemWith(self.textFieldNewItemTitle!.text, price: self.textFieldNewItemPrice!.text)
        }
        
        DAAlertController.showAlertViewInViewController(self,
            withTitle: "New Item",
            message: "Enter the item informations",
            actions: [cancelAction, saveAction],
            numberOfTextFields: 2,
            textFieldsConfigurationHandler: { (textFields: [AnyObject]!) -> Void in
                self.textFieldNewItemTitle = textFields.first as? UITextField
                self.textFieldNewItemPrice = textFields.last as? UITextField
                
                self.textFieldNewItemTitle!.placeholder = "Title (e.g. Bike)"
                self.textFieldNewItemPrice!.placeholder = "Price (e.g. 299,00)"
                self.textFieldNewItemPrice!.keyboardType = UIKeyboardType.DecimalPad
            }) { (textFields: [AnyObject]!) -> Bool in
                let price: Float? = self.textFieldNewItemPrice!.text.floatValue
                
                return ((!self.textFieldNewItemTitle!.text.isEmpty) && (price != nil) && (price > 0))
        }
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
}
