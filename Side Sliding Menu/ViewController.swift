//
//  ViewController.swift
//  Side Sliding Menu
//
//  Created by Tiffany Diamanta on 2/29/16.
//  Copyright © 2016 Tiffany Diamanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let mainView = UIView()
    let mainButton = UIButton(type: UIButtonType.System) as UIButton
    let blackTableView = UITableView()
    let items = ["Cell One", "Cell Two", "Cell Three", "Cell Four", "Cell Five", "Cell Six"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // let screenSize: CGRect = UIScreen.mainScreen().bounds
       // let valueWidth = screenSize.width * 0.50
       // let valueHeight = screenSize.height * 0.50
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let valueWidth = screenSize.width * 0.50
        let valueHeight = screenSize.height * 1.00
        
        let valueWidthMainView = screenSize.width * 1.00
        let valueHeightMainView = screenSize.height * 1.00
        
        let valueWidthMainButton = screenSize.width * 0.10
        let valueHeightMainButton = screenSize.height * 0.05
        // remember to always use " : " on action function
        let tap = UITapGestureRecognizer(target: self, action: "handletap:")
        
        blackTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TAB_CELL")
        blackTableView.backgroundColor = UIColor.blackColor()
        blackTableView.frame = CGRectMake(0, 0, valueWidth, valueHeight)
        blackTableView.delegate = self
        blackTableView.dataSource = self
        self.view.addSubview(blackTableView)
        
        mainView.frame = CGRectMake(0, 0, valueWidthMainView, valueHeightMainView)
        mainView.backgroundColor = UIColor.blueColor()
        view.addSubview(mainView)
        mainView.addGestureRecognizer(tap)
        mainView.userInteractionEnabled = true
        
        
        mainButton.frame = CGRectMake(10, 30, valueWidthMainButton, valueHeightMainButton)
        mainButton.setBackgroundImage(UIImage(named: "Menu Filled-100"), forState: UIControlState.Normal)
        mainButton.addTarget(self, action: "slideEffect", forControlEvents: UIControlEvents.TouchUpInside)
        mainView.addSubview(mainButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.blackTableView.dequeueReusableCellWithIdentifier("TAB_CELL")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.blackColor()
        
        return cell
    }
    
    func handletap(sender: UITapGestureRecognizer) {
        print("tap effect works")
        UIView.animateWithDuration(1.0, animations: ({
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let valueWidthMainView = screenSize.width * 1.00
            let valueHeightMainView = screenSize.height * 1.00
            
            self.mainView.frame = CGRectMake(0, 0, valueWidthMainView, valueHeightMainView)
            self.mainView.backgroundColor = UIColor.blueColor()
            self.view.addSubview(self.mainView)
            self.view.layoutIfNeeded()
        }))
    }


    func slideEffect() {
        print("Slide effect works")
        UIView.animateWithDuration(1.0, animations: ({
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let valueWidthMainView = screenSize.width * 1.00
            let valueHeightMainView = screenSize.height * 1.00
            
            self.mainView.frame = CGRectMake(100, 0, valueWidthMainView, valueHeightMainView)
            self.mainView.backgroundColor = UIColor.blueColor()
            self.view.addSubview(self.mainView)
            self.view.layoutIfNeeded()
        }))
    }
}

