//
//  OrderViewController.swift
//  Mesanius Restaurant
//
//  Created by Hannes Waller on 2014-10-01.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate{

    @IBOutlet weak var orderTableView: UITableView!
    var orderList:[Order] = [Order]()
    var menuList:[Dish] = [Dish]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.orderTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.orderTableView.dataSource = self
        self.orderTableView.delegate = self
        
        orderTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "MenuCell") as UITableViewCell
        
        //cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        println(self.orderList[indexPath.row]);
        //var label:String = self.orderList[indexPath.row].orderId
        //cell.textLabel?.text = self.orderList[indexPath.row].orderId
        var foodId = self.orderList[indexPath.row].item[0]
        var display:String = "\(self.orderList[indexPath.row].item[1]) st "
        var cost = 0
        
        for food in menuList {
            if food.id == foodId {
                display += food.name
                cost = food.price
            }
        }
        
        display += " á \(cost) kr - totalt \(cost * self.orderList[indexPath.row].item[1]) kr"
        
        cell.detailTextLabel?.text = display
        
        //cell.detailTextLabel?.text = subtitileText
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }

    


}
