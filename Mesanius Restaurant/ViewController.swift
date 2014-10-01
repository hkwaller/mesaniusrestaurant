//
//  ViewController.swift
//  Mesanius Restaurant
//
//  Created by Hannes Waller on 2014-10-01.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var menuList:[Dish] = [Dish]()
    var orderList:[Order] = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONHelper().fetchMenu { (callback) -> () in
            self.menuList = callback
            println("Found \(self.menuList.count) dishes in menu: ")
            for dish in self.menuList {
                println("dish id: \(dish.id) name: \(dish.name) price: \(dish.price)")
                
            }
        }
        
        JSONHelper().fetchOrders { (callback) -> () in
            self.orderList = callback
            println("Found \(self.orderList.count) orders: ")
            for order in self.orderList {
                println("order id: \(order.orderId) items: \(order.item)")
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update orders when returning to main view
        
        JSONHelper().fetchOrders { (callback) -> () in
            self.orderList = callback
            println("Found \(self.orderList.count) orders: ")
            for order in self.orderList {
                println("order id: \(order.orderId) items: \(order.item)")
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.destinationViewController is MenuViewController {
            println("Sending menu to Menu View Controller")
            var menuVC = segue.destinationViewController as MenuViewController
            menuVC.menuList = self.menuList
            
        } else if segue.destinationViewController is OrderViewController {
            println("Sending orders to Order View Controller")
            var orderVC = segue.destinationViewController as OrderViewController
            orderVC.orderList = self.orderList
        }
        
    }

}

