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
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        JSONHelper().fetchMenu { (callback) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.menuList = callback
            })
        }
        
        JSONHelper().fetchOrders { (callback) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.orderList = callback
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is MenuViewController {
            
            var menuVC = segue.destinationViewController as MenuViewController
            menuVC.menuList = self.menuList
            
        } else if segue.destinationViewController is OrderViewController {
            
            var orderVC = segue.destinationViewController as OrderViewController
            orderVC.orderList = self.orderList
            orderVC.menuList = self.menuList
            
        } else if segue.destinationViewController is NewOrderViewController {
            
            var neworderVc = segue.destinationViewController as NewOrderViewController
            neworderVc.menuList = self.menuList
        }
    }
    
}

