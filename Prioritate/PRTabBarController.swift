//
//  PRTabBarController.swift
//  Prioritate
//
//  Created by Henrique Morbin on 03/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PRTabBarController: UITabBarController {

    override func viewDidLoad() {
        
        if let items = self.tabBar.items {
            let item = items[0] as? UITabBarItem
            item!.title = "Dashboard"
            item!.image = UIImage(named: "amount")
        }
        
        if let items = self.tabBar.items {
            let item = items[1] as? UITabBarItem
            item!.title = "Priorities"
            item!.image = UIImage(named: "sliders")
        }
    }
}
