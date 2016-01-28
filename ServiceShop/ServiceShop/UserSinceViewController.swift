//
//  UserSinceViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/6.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class UserSinceViewController: BaseViewController {
    var nameTF : UITextField? = nil
    var nickNameTF : UITextField? = nil
    var chooseView : ChooseView? = nil
    var currentUser : AVUser? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func createView() {
        let nameTF = UITextField(frame: CGRectMake(10, 100, self.view.frame.size.width - 20, 40))
        nameTF.placeholder = "请输入真实姓名"
        nameTF.textAlignment = NSTextAlignment.Center
        nameTF.layer.cornerRadius = 3
        nameTF.layer.borderWidth = 0.5
        self.view.addSubview(nameTF)
        self.nameTF = nameTF
        
        let nickNameTF = UITextField(frame: CGRectMake(nameTF.frame.origin.x, nameTF.frame.size.height + nameTF.frame.origin.y + 20, nameTF.frame.size.width, nameTF.frame.size.height))
        nickNameTF.placeholder = "请输入昵称"
        nickNameTF.textAlignment = NSTextAlignment.Center
        nickNameTF.layer.cornerRadius = 3
        nickNameTF.layer.borderWidth = 0.5
        self.view.addSubview(nickNameTF)
        self.nickNameTF = nickNameTF
        
        let chooseView = ChooseView(frame: CGRectMake(nameTF.frame.origin.x, nickNameTF.frame.size.height + nickNameTF.frame.origin.y + 20, nameTF.frame.size.width, nameTF.frame.size.height))
//        chooseView.setLeftAndRightTitle(leftTitle: "男", rightTitle:"女")
        chooseView.setLeftAndRightTitle("选择性别", leftTitle: "男", rightTitle:"女")
        self.view.addSubview(chooseView)
        self.chooseView = chooseView
        
        let sureButton = UIButton(type:UIButtonType.Custom)
        sureButton.frame = CGRectMake(nickNameTF.frame.origin.x, chooseView.frame.size.height + chooseView.frame.origin.y + 20, nickNameTF.frame.size.width, nickNameTF.frame.size.height)
        sureButton.setTitle("保存", forState: UIControlState.Normal)
        sureButton.backgroundColor = UIColor.blueColor()
        sureButton.layer.cornerRadius = 4
        sureButton.layer.borderWidth = 0.5
        sureButton.addTarget(self, action: Selector("sureButtonClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(sureButton)
        
    }
    
    func sureButtonClicked() {

        let query = AVQuery(className:"userSinceTab")
        
        query.whereKey("UID", equalTo: self.currentUser?.objectId)
        
        query.findObjectsInBackgroundWithBlock { (object, error) -> Void in
            if object != nil {
                let myObjectArr = object as! [AVObject]

                let myObject = myObjectArr.first
                
                myObject?.setObject(self.nameTF?.text, forKey: "name")
                
                myObject?.setObject(self.nickNameTF?.text, forKey: "nickName")
                
                let sexType = self.chooseView?.loadSelectedButton()
                
                if sexType == 0 {
                    myObject?.setObject("男", forKey: "sex")
                } else {
                    myObject?.setObject("女", forKey: "sex")
                }
                
                myObject?.saveInBackgroundWithBlock({ (succeed, error) -> Void in
                    if succeed {
                        
                    }
                })
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
