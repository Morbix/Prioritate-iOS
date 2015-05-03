//
//  ViewController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 02/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PRDashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itensArray: [PFItem] = []
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        PRDataManager.sharedInstance.createFakeData()
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
        
        var identifier: String = CELL_ITEM
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

