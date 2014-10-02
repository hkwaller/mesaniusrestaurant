//
//  DetailViewController.swift
//  Mesanius Restaurant
//
//  Created by Hannes Waller on 2014-10-02.
//  Copyright (c) 2014 Hannes Waller. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var dishId:Int = 0
    var desc:String = ""
    var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("desc \(desc)")
        println("name \(name)")
        println("id \(dishId)")

        nameLabel.text = name
        descLabel.text = desc
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
