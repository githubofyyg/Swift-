//
//  ServiceViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/7.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class ServiceViewController: BaseTableViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView : UICollectionView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        bindModel(myArray: self.dataArray!)
        
        
    }
    override func createView() {
        super.createView()

    self.tableView?.registerClass(ServiceTableViewCell.self, forCellReuseIdentifier: "ServiceCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        
        flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 30) / 2, (self.view.frame.size.width - 30) / 2)
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        
        self.collectionView = UICollectionView(frame: CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49), collectionViewLayout: flowLayout)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.registerClass(ServiceCollectionViewCell.self, forCellWithReuseIdentifier:"CollectionViewCell")
        self.collectionView?.hidden = true
        self.view.addSubview(self.collectionView!)
        let rightButton = UIButton(type:UIButtonType.Custom)
        
        rightButton.setTitle("切换", forState: UIControlState.Normal)
        rightButton.backgroundColor = UIColor.redColor()
        rightButton.frame = CGRectMake(0, 0, 40, 40)
        
        rightButton.addTarget(self, action: Selector("changeViewButtonClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView:rightButton)
    
        
        
    }
    
    override func bindModel(myArray dataArray: NSMutableArray) {
        
        

        
    }
    
    override func viewWillAppear(animated: Bool) {
    
        super.viewWillAppear(animated)
        
        let query = AVQuery(className:"servireTable")
        
        //query.whereKey("UID", equalTo: AVUser.currentUser().objectId)
        
        query.orderByDescending("createdAt")
        
        query.findObjectsInBackgroundWithBlock { (object, error) -> Void in
            if object != nil {
                let myObjectArr = object as! [AVObject]
                
                self.dataArray?.setArray(myObjectArr)
                
                print(self.dataArray)
                
                self.tableView!.reloadData()
                
            }
        }
        
    }
    
    
     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataArray?.count)!
    }
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ServiceCell", forIndexPath: indexPath) as! ServiceTableViewCell
        
        let array = NSArray(array: self.dataArray!)
        
        let object = array[indexPath.row] as! AVObject
        
        
        
        cell.priceLabel?.text = object.objectForKey("price") as? String
        cell.titleLabel?.text = object.objectForKey("serviceTitle") as? String
        cell.statusLabel?.text = object.objectForKey("type") as? String
        
        let curDate = object.objectForKey("createdAt") as! NSDate
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateAtr = formatter.stringFromDate(curDate) 
        
        cell.timeLabel?.text = dateAtr
        
        

        let attachment = object.objectForKey("imageArr") as! AVFile
        
        print(attachment)
        let urlStr = attachment.url as String
        let url = NSURL(string: urlStr)
        
        let data = NSMutableData(contentsOfURL: url!)
        
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
        
        //unarchiver.decodeObjectForKey("imageArray")
        
        print(unarchiver.decodeObjectForKey("imageArray")!)
        
        print(unarchiver.decodeObjectForKey("imageArray")!.objectAtIndex(0))
        
        var image = UIImage()
        image = unarchiver.decodeObjectForKey("imageArray")!.objectAtIndex(0) as! UIImage
        
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            
             cell.headerImage?.image = image
        }
            
    
        
//        
//        let urlStr = attachment.url
//        
//        print(urlStr)
//        let url = NSURL(string: urlStr)
//        
//        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
//            
//            cell.headerImage?.sd_setImageWithURL(url)
//            
//            
//        }
        
       
        
     
        
        
        return cell
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    func changeViewButtonClicked() {
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            if self.collectionView?.hidden == true{
                self.collectionView?.hidden = false
                self.tableView?.hidden = true
            } else {
                self.collectionView?.hidden = true
                self.tableView?.hidden = false
            }
            }) { (succeed) -> Void in
                
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! ServiceCollectionViewCell
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    
    //cell点击方法
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let publicVC = PublishServiceViewController()
        
        self.showViewController(publicVC, sender: nil);

        
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let publicVC = PublishServiceViewController()

        self.showViewController(publicVC, sender: nil);
        
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
