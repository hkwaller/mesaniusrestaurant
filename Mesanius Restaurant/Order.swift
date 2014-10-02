//
//  Order.swift
//  Mesanius
//
//  Created by Hannes Waller on 2014-10-01.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import Foundation

class Order {
    
    var orderId: Int
    var item: Array<Int>
    var itemId: Int
    var quantity: Int
    
    init(orderId: Int, itemId: Int, quantity: Int){
        
        self.orderId = orderId
        self.itemId = itemId
        self.quantity = quantity
        self.item = [itemId, quantity]
        
    }
}
