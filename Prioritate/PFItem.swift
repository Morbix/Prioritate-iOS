//
//  PFItem.swift
//  Prioritate
//
//  Created by Henrique Morbin on 02/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import UIKit

class PFItem: PFObject, PFSubclassing {
    
    dynamic var name: String = ""
    dynamic var isCompleted: Bool = false
    dynamic var isBought: Bool = false
    dynamic var progress: Float = 0.0
    
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
    
    override init(){
        super.init()
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
        self.isCompleted = false
        self.isBought = false
        self.progress = 0.0
    }
    
    convenience init(name: String, progress: Float) {
        self.init()
        self.name = name
        self.isCompleted = false
        self.isBought = false
        self.progress = progress
    }
    
    override var description: String {
        var percent: String = NSString(format: "%.2f", self.progress*100) as String
        return self.name + " ("+percent+"%)"
    }
    
    func getDisplayName() -> String{
        return self.name
    }
}
