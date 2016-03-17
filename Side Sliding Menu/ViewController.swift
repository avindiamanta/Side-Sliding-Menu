//
//  ViewController.swift
//  Side Sliding Menu
//
//  Created by Tiffany Diamanta on 2/29/16.
//  Copyright © 2016 Tiffany Diamanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private struct AnimationKey {
        static let animation = "animation"
    }
    
    let mainView = UIView()
    let mainButton = UIButton(type: UIButtonType.System) as UIButton
    let blackTableView = UITableView()
    let items = ["Cell One", "Cell Two", "Cell Three", "Cell Four", "Cell Five", "Cell Six"]
    let secondButton = UIButton(type: UIButtonType.System) as UIButton
    let pathLayerO = CAShapeLayer()
    let pathLayer = CAShapeLayer()
    

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
        
        let valueWidthMailButton = screenSize.width * 0.16
        let valueHeightMailButton = screenSize.height * 0.09
        
        secondButton.frame = CGRectMake(0, 0, valueWidthMailButton, valueHeightMailButton)
        secondButton.center = CGPointMake(view.bounds.midX, view.bounds.midY)
        secondButton.layer.cornerRadius = 0.5 * secondButton.bounds.size.width
        secondButton.backgroundColor = UIColor.grayColor()
        secondButton.addTarget(self, action: "plane", forControlEvents: UIControlEvents.TouchDown)
        mainView.addSubview(secondButton)
        
        let maxPaperplaneRotation = -CGFloat(M_PI_4)
        
        // this is how to draw Plane
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 14.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 46.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 29.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 42.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 29.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 38.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 29.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 23.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 14.0/56.0 * secondButton.bounds.height))
        path.closePath()
        
        
        pathLayerO.frame = CGRect(x: CGRectGetMidX(view.bounds) * 0.75, y: CGRectGetMidY(view.bounds) * 0.97, width: 5, height: 5)
        pathLayerO.path = path.CGPath
        pathLayerO.strokeColor = UIColor.redColor().CGColor
        pathLayerO.fillColor = nil
        pathLayerO.lineWidth = 2.0
        pathLayerO.lineJoin = kCALineJoinBevel
        pathLayerO.transform = CATransform3DMakeRotation(maxPaperplaneRotation, 0.0, 0.0, 1.0)
        
        mainView.layer.addSublayer(pathLayerO)
        
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
    
    func plane() {
        pathLayerO.removeFromSuperlayer()
        let maxPaperplaneRotation = -CGFloat(M_PI_4)
        
        // this is how to draw Plane
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 14.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 46.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 29.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 42.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 29.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 38.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 29.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 23.0/56.0 * secondButton.bounds.height))
        path.addLineToPoint(CGPointMake(secondButton.bounds.minX + 16.0/56.0 * secondButton.bounds.width, secondButton.bounds.minY + 14.0/56.0 * secondButton.bounds.height))
        path.closePath()
        
        
        pathLayer.frame = CGRect(x: CGRectGetMidX(view.bounds) * 0.75, y: CGRectGetMidY(view.bounds) * 0.97, width: 5, height: 5) //self.view.bounds
        //center = CGPointMake(view.bounds.midX, view.bounds.midY)
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor.redColor().CGColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 2.0
        pathLayer.lineJoin = kCALineJoinBevel
        //pathLayer.setNeedsDisplay()
        pathLayer.transform = CATransform3DMakeRotation(maxPaperplaneRotation, 0.0, 0.0, 1.0)
        self.view.layer.addSublayer(pathLayer)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = {
            let path = UIBezierPath()
            
            // This is the first position of the plane
            path.moveToPoint(CGPoint(x: CGRectGetMidX(view.bounds) * 0.75, y: CGRectGetMidY(view.bounds) * 0.97))
            // this is how the plane move through the x and y axis
            // This is where the animation begin
            path.addQuadCurveToPoint(CGPoint(x: 5.1 * view.bounds.width, y: -0.45 * view.bounds.height), controlPoint: CGPoint(x: 0.6 * view.bounds.width, y: -0.3 * view.bounds.height))
            return path.CGPath
            }()
        // This effect just to animate the shrinking process of the plane
        let shrinkAnimation = CABasicAnimation(keyPath: "transform.scale")
        shrinkAnimation.toValue = CGFloat(0.2)
        
        let flyOutGroupAnimation = CAAnimationGroup()
        flyOutGroupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        flyOutGroupAnimation.duration = 1.0
        flyOutGroupAnimation.animations = [animation, shrinkAnimation]
        animation.fillMode = kCAFillModeForwards
        flyOutGroupAnimation.removedOnCompletion = false
        
        pathLayer.addAnimation(flyOutGroupAnimation, forKey: AnimationKey.animation)
    }
}

