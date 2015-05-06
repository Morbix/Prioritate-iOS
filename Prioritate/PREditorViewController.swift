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

    //MARK: - Actions
    @IBAction func barButtonAddTouched(sender: AnyObject) {
        self.presentViewController(PRItemDetailViewController.getInstance(), animated: true, completion: nil)
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
