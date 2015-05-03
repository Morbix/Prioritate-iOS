//
//  PRCellItem.swift
//  Prioritate
//
//  Created by Henrique Morbin on 02/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PRCellItem: UITableViewCell, MXCellProtocol {
    
    @IBOutlet var labelDisplayName: UILabel!
    @IBOutlet var progressItem: LDProgressView!
    
    func mx_configureCell(object: AnyObject?, target: AnyObject?, indexPath: NSIndexPath?) {
        if let item = object as? PFItem {
            self.labelDisplayName.text = item.getDisplayName()
            self.progressItem.progress = CGFloat(item.progress)
        }else{
            self.labelDisplayName.text = "N/A"
            self.progressItem.progress = 0.0
        }
    }
}
