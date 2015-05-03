//
//  PRCellItemEditor.swift
//  Prioritate
//
//  Created by Henrique Morbin on 03/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PRCellItemEditor: UITableViewCell, MXCellProtocol {

    func mx_configureCell(object: AnyObject?, target: AnyObject?, indexPath: NSIndexPath?) {
        if let item = object as? PFItem {
            self.textLabel?.text = item.getDisplayName()
        }
    }
}
