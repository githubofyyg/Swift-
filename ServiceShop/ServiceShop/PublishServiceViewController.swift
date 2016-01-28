//
//  PublishServiceViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/10.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class PublishServiceViewController: BaseTableViewController {
    var height : Bool = false

    var price : String? = nil
    var titleSince : String? = nil
    var brief : String? = nil
    var type : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func createView() {
        super.createView()
        self.tableView?.registerClass(AddSinceTableViewCell.self, forCellReuseIdentifier: "sinceCell")
        self.tableView?.registerClass(AddBriefTableViewCell.self, forCellReuseIdentifier:"briefCell")
        self.tableView?.registerClass(AddChooseViewTableViewCell.self, forCellReuseIdentifier:"chooseCell")
        self.tableView?.registerClass(AddPhotoTableViewCell.self, forCellReuseIdentifier:"choosePhotoCell")
        
        let publishButton = UIButton(type: UIButtonType.Custom)
        publishButton.frame = CGRectMake(10, 500, self.view.frame.size.width - 20, 30)
        publishButton.backgroundColor = UIColor.blueColor()
        publishButton.addTarget(self, action: Selector("publishButtonAction"), forControlEvents: UIControlEvents.TouchUpInside)
        publishButton.setTitle("发布", forState: UIControlState.Normal)
        self.view.addSubview(publishButton)
        
    }
    
    func publishButtonAction(){
        
        
        if self.price != nil && self.titleSince != nil && self.type != nil{
      
            let indexPath : NSIndexPath = NSIndexPath(forItem: 4, inSection: 0)
            
            let cell = self.tableView?.cellForRowAtIndexPath(indexPath) as! AddPhotoTableViewCell
            
            let array : NSMutableArray = cell.imageArr!
            
            let data = NSMutableData()
            
            let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
            archiver.encodeObject(array, forKey: "imageArray")

            archiver.finishEncoding()
            
            let file : AVFile = AVFile(name: "goodsImage", data: data)

            
            file.saveInBackgroundWithBlock({ (succeed, error) -> Void in
                
                if succeed {
                    
                    let user = AVUser()
                    let object : AVObject = AVObject(className: "servireTable")
                    object.setObject(self.titleSince, forKey: "serviceTitle")
                    object.setObject(self.price, forKey: "price")
                    object.setObject(self.brief, forKey: "brief")
                    object.setObject(self.type, forKey: "type")
                    object.setObject(file, forKey: "imageArr")
                    object.setObject(user.objectId, forKey: "UID")
                    object.saveInBackgroundWithBlock({ (succeed, error) -> Void in
                        
                        if succeed {
                            
                            print("上传数据成功")
                            
                        }else{
                            
                            print(error)
                        }
                        
                    })
                    
                    
                }
                
            })

            
            
            
            
            
            
            
            
            
            
            
            
            
//            let image : UIImage = array.firstObject as! UIImage
//            
//            let ImageData : NSData = UIImageJPEGRepresentation(image, 0.6)!
//            
//            let file : AVFile = AVFile(name: "goodsImage", data: ImageData)
//            
//            file.saveInBackgroundWithBlock({ (succeed, error) -> Void in
//                
//                if succeed {
//                    
//                    let user = AVUser()
//                    let object : AVObject = AVObject(className: "servireTable")
//                    object.setObject(self.titleSince, forKey: "serviceTitle")
//                    object.setObject(self.price, forKey: "price")
//                    object.setObject(self.brief, forKey: "brief")
//                    object.setObject(self.type, forKey: "type")
//                    object.setObject(file, forKey: "file")
//                    object.setObject(user.objectId, forKey: "UID")
//                    object.saveInBackgroundWithBlock({ (succeed, error) -> Void in
//                    
//                        if succeed {
//                            
//                            print("上传数据成功")
//                            
//                        }else{
//                            
//                            print(error)
//                        }
//                        
//                    })
//
//                    
//                }
//                
//            })
            
       
        }else{
            
            self.showAlert("信息不能为空")
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 100
        }else if indexPath.row == 3 {
            if self.height == true {
                return 200
            } else {
                return 44
            }
        }else if indexPath.row == 4 {
            return 100
        }else {
            return 44
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("sinceCell", forIndexPath: indexPath) as! AddSinceTableViewCell
            
            cell.setTitle("价格", textFieldPlace:"请输入价格")
            cell.sinceBlock = { (since : String) -> Void in
                print("价格是\(since)")
                
                self.price = since
                
                
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("sinceCell", forIndexPath: indexPath) as! AddSinceTableViewCell
            cell.setTitle("服务名称", textFieldPlace:"请输入服务名称")
            cell.sinceBlock = { (since : String) -> Void in
                print("服务名字是\(since)")
                
                self.titleSince = since
                
            }
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("briefCell", forIndexPath: indexPath) as! AddBriefTableViewCell
            cell.sinceBlock = { (since : String) -> Void in
                print("简介是\(since)")
                
                
                self.brief = since
                
            }
            return cell
        } else if indexPath.row == 3 {
          let cell = tableView.dequeueReusableCellWithIdentifier("chooseCell", forIndexPath: indexPath) as! AddChooseViewTableViewCell
            cell.chooseView?.myChooseBlock = { (index : Int) -> Void in
                self.tableView?.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                if index == 0 {
                    self.height = false
                    self.type = "线上"
                } else {
                    self.height = true
                    self.type = "线下"
                }
                print("类型\(index)")
                
                
                
            }
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("choosePhotoCell", forIndexPath: indexPath) as! AddPhotoTableViewCell
            cell.myVC = self
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath)
            return cell
            

        }
        
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
