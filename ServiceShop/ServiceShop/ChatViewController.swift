//
//  ChatViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/7.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class ChatViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func createView() {
        super.createView()
        
        self.tableView?.registerClass(ChatTableViewCell.self, forCellReuseIdentifier: "ChatCell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChatCell", forIndexPath: indexPath) as! ChatTableViewCell
        
        cell.imageView?.image = UIImage(named:"iconfont-touxiang")
        cell.textLabel?.text = "联系人名称"
        cell.detailTextLabel?.text = "最后一次聊天内容"
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.mainScreen().scale
        return cell
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
