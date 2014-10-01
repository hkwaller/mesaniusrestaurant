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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.orderTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.orderTableView.dataSource = self
        self.orderTableView.delegate = self
        
        //self.orderList = ViewController.getOrderList()
        
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
        
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        println(self.orderList[indexPath.row]);
        //var label:String = self.orderList[indexPath.row].orderId
        //cell.textLabel?.text = self.orderList[indexPath.row].orderId
        var subtitileText = String(self.orderList[indexPath.row].item.count) + " retter"
        cell.detailTextLabel?.text = subtitileText
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }

    


}
