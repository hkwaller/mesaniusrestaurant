//
//  Dish.swift
//  Mesanius
//
//  Created by Hannes Waller on 2014-10-01.
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