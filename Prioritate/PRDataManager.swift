//
//  PRDataManager.swift
//  Prioritate
//
//  Created by Henrique Morbin on 03/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import Foundation

class PRDataManager {
    
    var itemsArray = [PFItem]()
    var selectedItem: PFItem?

    
    class var sharedInstance: PRDataManager {
        struct Static {
            static var instance: PRDataManager?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = PRDataManager()
        }
        
        return Static.instance!
    }
    
    func createFakeData() {
        itemsArray.append(PFItem(name: "Bike", progress: 0.5))
        itemsArray.append(PFItem(name: "Play 4", progress: 0.3))
        itemsArray.append(PFItem(name: "Fogão", progress: 0.1))
        itemsArray.append(PFItem(name: "Tênis"))
    }
}