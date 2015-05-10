//
//  PRExtensions.swift
//  Prioritate
//
//  Created by Henrique Morbin on 05/05/15.
//  Copyright (c) 2015 Morbix. All rights reserved.
//

import Foundation

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension Float {
    var numberValue: NSNumber {
        return NSNumber(float: self)
    }
    
    var percentFormat: String {
        var percent: String = NSString(format: "%.2%%", self*100) as String
        return percent
    }
    
    var currencyFormat: String {
        var currency: String = NSString(format: "$%.2", self) as String
        return currency
    }
}

