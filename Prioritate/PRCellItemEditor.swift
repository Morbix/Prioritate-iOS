//
//  PRCellItemEditor.swift
//  Prioritate
//
//  Created by Henrique Morbin on 03/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PRCellItemEditor: UITableViewCell, MXCellProtocol, ASValueTrackingSliderDelegate {
    @IBOutlet var labelDisplayName: UILabel!
    @IBOutlet var slideItem: ASValueTrackingSlider!
    
    override func awakeFromNib() {
        self.slideItem.delegate = self;
    }

    func mx_configureCell(object: AnyObject?, target: AnyObject?, indexPath: NSIndexPath?) {
        if let item = object as? PFItem {
            self.labelDisplayName?.text = item.getDisplayName()
        }
    }
    
    //MARK: - ASValueTrackingSliderDelegate
    func sliderWillDisplayPopUpView(slider: ASValueTrackingSlider!) {
        self.superview?.bringSubviewToFront(self)
    }
}
