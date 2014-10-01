//
//  Dish.swift
//  Mesanius
//
//  Created by Henrik Holmsen on 29.09.14.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import Foundation

class Dish {
    
    var id: Int
    var name: String
    var price: Int
    var description: String
    
    init(id: Int, name: String, price: Int){
    
        self.id = id
        self.name = name
        self.price = price
        self.description = "default: ikke angitt"
    }
}