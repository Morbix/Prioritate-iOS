//
//  PREditorViewController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 03/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

let CELL_ITEM_EDITOR = "PRCellItemEditor"

class PREditorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itensArray: [PFItem] = []
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.reloadAllData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Methods
    func reloadAllData() {
        itensArray = []
        itensArray += PRDataManager.sharedInstance.itensArray
        table.reloadData()
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
        return 64
    }
}
