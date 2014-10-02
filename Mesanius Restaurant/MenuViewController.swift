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
    var index = 0;
    var desc = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.menuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.menuTableView.dataSource = self
        self.menuTableView.delegate = self

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
        
        index = indexPath.row
        
        cell.textLabel?.text = self.menuList[indexPath.row].name
        var subtitileText = String(self.menuList[indexPath.row].price) + " kr"
        cell.detailTextLabel?.text = subtitileText
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        
        println("Decriptopn for dish nr: \(indexPath.row+1)")
        self.index = indexPath.row
        
        JSONHelper().fetchDescription(menuList[indexPath.row], completionHandler: { (callback) -> () in
            
            println("Dish object: \(callback.description)")
            self.desc = callback.description
            
        })
        
        self.performSegueWithIdentifier("detailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        
        if segue!.identifier == "detailSegue" {
            let viewController:DetailViewController = segue!.destinationViewController as DetailViewController
            
            let indexPath = menuTableView.indexPathForSelectedRow()
            
            viewController.dishId = self.menuList[self.index].id as Int
            viewController.desc = self.desc
            viewController.name = self.menuList[self.index].name as String;
        }
        
    }

}
