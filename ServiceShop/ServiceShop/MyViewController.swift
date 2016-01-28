//
//  MyViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/7.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class MyViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func createView() {
        super.createView()
        let view = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 200))
        
        let headerImageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        
        headerImageView.center = view.center
        
        headerImageView.layer.cornerRadius = 50
        
        headerImageView.backgroundColor = UIColor.redColor()
        
        view.addSubview(headerImageView)
        
        self.tableView?.tableHeaderView = view
        
        self.tableView?.registerClass(MyTableViewCell.self, forCellReuseIdentifier: "MyCell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyTableViewCell
        
        switch indexPath.row {
        case 0 :
            cell.textLabel?.text = "性别"
            cell.detailTextLabel?.text = "男"
        case 1:
            cell.textLabel?.text = "姓名"
            cell.detailTextLabel?.text = "张三"
        case 2:
            cell.textLabel?.text = "联系方式"
            cell.detailTextLabel?.text = "18699998888"
        case 3:
            cell.textLabel?.text = "发布服务"
            
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let publishVC = PublishServiceViewController()
        self.navigationController?.pushViewController(publishVC, animated: true)
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
