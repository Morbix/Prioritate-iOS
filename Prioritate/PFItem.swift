//
//  PFItem.swift
//  Prioritate
//
//  Created by Henrique Morbin on 02/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PFItem: PFObject, PFSubclassing {
    
    var name: String = ""
    var isCompleted: Bool = false
    var isBought: Bool = false
    var progress: Float = 0.0
    var price: Float = 0.0
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Item"
    }
    
    init(name: String) {
        self.name = name
        self.isCompleted = false
        self.isBought = false
        self.progress = 0.0
        self.price = 0.0
        
        super.init()
    }
    
    init(name: String, progress: Float) {
        self.name = name
        self.isCompleted = false
        self.isBought = false
        self.progress = progress
        self.price = 0.0
        
        super.init()
    }
    
    init(name: String, price: Float) {
        self.name = name
        self.isCompleted = false
        self.isBought = false
        self.progress = 0.0
        self.price = price
        
        super.init()
    }
    
    override var description: String {
        var percent: String = NSString(format: "%.2f", self.progress*100) as String
        return self.name + " (" + percent + "%)"
    }
    
    func getDisplayName() -> String {
        return self.name
    }
    
    func getDisplayNameAndPrice() -> String {
        return self.name + " ($)" + self.price.currencyFormat
    }
}
