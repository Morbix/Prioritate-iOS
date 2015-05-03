//
//  ViewController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 02/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UITableViewDelegate and UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var identifier: String
        var object: AnyObject
        
        identifier = "Cell"
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier,
            forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "Section \(indexPath.section) Cell \(indexPath.row)"
        
        return cell
    }

}

