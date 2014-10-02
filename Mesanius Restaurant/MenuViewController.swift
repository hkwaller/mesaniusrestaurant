//
//  MenuViewController.swift
//  Mesanius Restaurant
//
//  Created by Hannes Waller on 2014-10-01.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var menuList:[Dish] = [Dish]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.menuTableView.dataSource = self
        self.menuTableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.menuTableView.reloadData()
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
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        cell.textLabel?.text = self.menuList[indexPath.row].name
        cell.detailTextLabel?.text = String(self.menuList[indexPath.row].price) + " kr"
        
        return cell
    }

    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
       
        JSONHelper().fetchDescription(menuList[indexPath.row], completionHandler: { (callback) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                var dish: Dish = callback
                UIAlertView(title: "\(dish.name)", message: "\(dish.description)", delegate: self, cancelButtonTitle: "Ok").show()
            })
        })
    }
}
