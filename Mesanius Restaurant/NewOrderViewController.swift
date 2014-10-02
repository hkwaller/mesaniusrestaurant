//
//  NewOrderViewController.swift
//  Mesanius Restaurant
//
//  Created by Hannes Waller on 2014-10-02.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class NewOrderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {
    

    @IBAction func placeOrder(sender: AnyObject) {
        var amount = amountField.text.toInt()
        println("sender: \(newOrderId) \(newOrderName) \(newOrderPrice) och jag vill ha \(amount)")
        
    }
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var menuList:[Dish] = [Dish]()
    
    var newOrderId:Int = 0
    var newOrderName:String = ""
    var newOrderPrice:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        println(self.menuList)

        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "MenuCell") as UITableViewCell
        cell.textLabel?.text = self.menuList[indexPath.row].name
        //var subtitileText = String(self.menuList[indexPath.row].price) + " kr"
        //cell.detailTextLabel?.text = subtitileText
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.newOrderName = self.menuList[indexPath.row].name
        self.newOrderId = self.menuList[indexPath.row].id
        self.newOrderPrice = self.menuList[indexPath.row].price
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
      
        
    }

}
