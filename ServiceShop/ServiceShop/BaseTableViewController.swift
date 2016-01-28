//
//  BaseTableViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/7.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView : UITableView? = nil
    var dataArray : NSMutableArray? = nil
    var loadingImageView : UIImageView? = nil
    var timer : NSTimer? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func createView() {
        self.dataArray = NSMutableArray()
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.view.addSubview(self.tableView!)
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        
        self.tableView?.tableFooterView =  UIView()
        
        self.loadingImageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        self.loadingImageView?.center = (self.tableView?.center)!
        self.loadingImageView?.hidden = true
        self.view.addSubview(self.loadingImageView!)
        self.loadingImageView?.backgroundColor = UIColor.redColor()
    }
    
    func bindModel(myArray dataArray : NSMutableArray) {
        self.dataArray = dataArray
        self.tableView?.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataArray?.count)!

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath) 
        return cell
    }
    
    func beginAnimation() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("imageViewTransform"), userInfo: nil, repeats: true)
        self.timer?.fire()
    }
    
    func endAnimation() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func imageViewTransform() {
        self.loadingImageView?.transform = CGAffineTransformRotate((self.loadingImageView?.transform)!, CGFloat(M_PI_4 / 4.5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
