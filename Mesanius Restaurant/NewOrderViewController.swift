//
//  NewOrderViewController.swift
//  Mesanius Restaurant
//
//  Created by Hannes Waller on 2014-10-02.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class NewOrderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {
    
@IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var menuList:[Dish] = [Dish]()
    var newOrderId:Int = 0
    var newOrderName:String = ""
    var newOrderPrice:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.tableView.reloadData()
    }
    
    @IBAction func placeOrder(sender: AnyObject) {
        
        // TODO: Send data to REST
        
        // Temp mockup
        var amount = amountField.text.toInt()
        UIAlertView(title: "Ny ordre lagt til", message: "\(amount!)x \(newOrderName).\nTotal sum: \(newOrderPrice*amount!)kr", delegate: self, cancelButtonTitle: "OK").show()
    }
    
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        
        if buttonIndex == 0 {
            
            self.navigationController?.popToRootViewControllerAnimated(true)
            self.newOrderId = 0
            self.newOrderName = ""
            self.newOrderPrice = 0
        }
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
        cell.tag = 0
        cell.accessoryType = UITableViewCellAccessoryType.None

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = self.menuList[indexPath.row].name
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        self.newOrderName = self.menuList[indexPath.row].name
        self.newOrderId = self.menuList[indexPath.row].id
        self.newOrderPrice = self.menuList[indexPath.row].price
        
        if cell.tag == 0 {
            cell.tag = 1
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else if cell.tag == 1 {
            cell.tag = 0
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
    }

}
