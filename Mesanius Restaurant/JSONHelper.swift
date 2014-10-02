//
//  JSONHelper.swift
//  Mesanius
//
//  Created by Henrik Holmsen on 29.09.14.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import Foundation

class JSONHelper{
    
     func fetchMenu(completionHandler: (callback: [Dish]) -> ()) {
    
        var menuList = [Dish]()
        
        let urlPath = "http://localhost:8080/rest/menu/"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if (error != nil) {
                completionHandler(callback: menuList)
                println(error)
            } else {
                
                let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                //println(jsonResult)
                
                if let dict = jsonResult as? NSArray {
                    
                    for food : AnyObject in dict {
                        
                        if let foodInfo = food as? Dictionary<String, AnyObject> {
                            
                            if let id = foodInfo["id"] as AnyObject? as Int?{
                                if let name = foodInfo["name"] as AnyObject? as String?{
                                    if let price = foodInfo["price"] as AnyObject? as Int? {
                                        menuList.append(Dish(id: id, name: name, price: price))
                                    }
                                }
                            }
                        }
                    }
                }
                //Sort list with ascending id's
                menuList.sort({$0.id < $1.id})
                // Send callback with menuList
                completionHandler(callback: menuList)
            }
            
        })
        
        task.resume()
        
    }
    
    func fetchDescription(dish: Dish ,completionHandler: (callback: Dish) -> ()) {
        
        let urlPath = "http://localhost:8080/rest/menu/" + String(dish.id)
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        
        var description:String = ""
        
        
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if (error != nil) {
                description = "error getting description"
                completionHandler(callback: dish)
                println(error)
            } else {
                
                let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                //println(jsonResult)
                
               if let foodInfo = jsonResult as? Dictionary<String, AnyObject> {
                    
                    if let desc = foodInfo["description"] as AnyObject? as String?{
                        description = desc
                        dish.description = description
                    }
                   
                }
                // Send callback with menuList
                completionHandler(callback: dish)
            }
            
        })
        
        task.resume()
    
    
    }
    
    func fetchOrders(completionHandler: (callback: [Order]) -> ()) {
        
        var orderList = [Order]()
        
        let urlPath = "http://localhost:8080/rest/order/"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if (error != nil) {
                completionHandler(callback: orderList)
                println(error)
            } else {
                
                let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                if let dict = jsonResult as? NSArray {
                    
                    for order : AnyObject in dict {
                        if let orderInfo = order as? Dictionary<String, AnyObject> {
                            if let orderId = orderInfo["orderId"] as AnyObject? as Int?{
                                if let item: AnyObject = orderInfo["item"] as AnyObject? as AnyObject?{
                                    var itemId:Int = item["item"] as Int
                                    var quantity:Int = item["quantity"] as Int
                                    orderList.append(Order(orderId: orderId, itemId: itemId, quantity: quantity))
                                }
                            }
                        }
                    }
                }
                //Sort list with ascending id's
                orderList.sort({$0.orderId < $1.orderId})
                // Send callback with menuList
                completionHandler(callback: orderList)
            }
            
        })
        
        task.resume()
        
    }

}