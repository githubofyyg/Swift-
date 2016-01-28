//
//  RegisterViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/5.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var headerButton : UIButton? = nil
    var userNameTF : UITextField? = nil
    var passWordTF : UITextField? = nil
    var affirmTF : UITextField? = nil
    var verifyTF : UITextField? = nil
    var verifyButton : UIButton? = nil
    var loginButton : UIButton? = nil
    var headerImageData : NSData? = nil
    var timer : NSTimer? = nil
    var timeNum : Int? = 60
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func createView() {
        headerButton = UIButton(type:UIButtonType.Custom)
        
        headerButton!.frame = CGRectMake(100, 0, 100, 100)
        
        headerButton!.center = CGPointMake(self.view.frame.size.width / 2, 100)
        
        headerButton!.setTitle("头像", forState: UIControlState.Normal)
        
        headerButton!.backgroundColor = UIColor.blueColor()
        
        headerButton!.layer.cornerRadius = 50
        
        headerButton?.addTarget(self, action: Selector("headerButtonClciked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(headerButton!)
        
        userNameTF = UITextField(frame: CGRectMake(10, headerButton!.frame.size.height + headerButton!.frame.origin.y + 20, self.view.frame.size.width - 20, 40))
        
        userNameTF!.placeholder = "请输入用户名"
        
        userNameTF!.layer.borderWidth = 0.5
        
        userNameTF!.textAlignment = NSTextAlignment.Center
        
        userNameTF!.layer.cornerRadius = 3.0
        
        self.view.addSubview(userNameTF!)
        
        passWordTF = UITextField(frame: CGRectMake(10, userNameTF!.frame.size.height + userNameTF!.frame.origin.y + 20, self.view.frame.size.width - 20, 40))
        
        passWordTF?.layer.borderWidth = 0.5
        
        passWordTF?.placeholder = "请输入密码"
        
        passWordTF?.layer.cornerRadius = 3
        
        
        passWordTF?.textAlignment = NSTextAlignment.Center
        
        passWordTF?.delegate = self
        
        self.view.addSubview(passWordTF!)
        
        
        affirmTF = UITextField(frame: CGRectMake(10, (passWordTF?.frame.size.height)! + (passWordTF?.frame.origin.y)! + 20, self.view.frame.size.width - 20, 40))
        
        affirmTF?.layer.borderWidth = 0.5
        
        affirmTF?.layer.cornerRadius = 3
        
        affirmTF?.placeholder = "请确认密码"
        
        affirmTF?.textAlignment = NSTextAlignment.Center
        
        affirmTF?.delegate = self
        
        self.view.addSubview(affirmTF!)
        
        
        let verifyTF = UITextField(frame: CGRectMake(10, ((affirmTF?.frame.size.height)! + (affirmTF?.frame.origin.y)! + 10), self.view.frame.size.width / 2 - 15, 40))
        
        verifyTF.layer.borderWidth = 0.5
        
        verifyTF.layer.cornerRadius = 3
        
        verifyTF.placeholder = "请输入验证码"
        
        verifyTF.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(verifyTF)
        
        self.verifyTF = verifyTF
        
        
        let verifyButton = UIButton(type:UIButtonType.Custom)
        
        verifyButton.frame = CGRectMake(self.view.frame.size.width / 2 + 5, verifyTF.frame.origin.y , verifyTF.frame.size.width , 40)
        
        verifyButton.backgroundColor = UIColor.blueColor()
        
        verifyButton.layer.cornerRadius = 3
        
        verifyButton.setTitle("获取验证码", forState: UIControlState.Normal)
        verifyButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        
        verifyButton.addTarget(self, action: Selector("verifyButtonClciked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.verifyButton = verifyButton
        
        self.view.addSubview(verifyButton)
        
        
        let sureButton = UIButton(type:UIButtonType.Custom)
        
        sureButton.frame = CGRectMake(10, verifyButton.frame.size.height + verifyButton.frame.origin.y + 20, self.view.frame.size.width - 20, 40)
        
        sureButton.backgroundColor = UIColor.blueColor()
        
        sureButton.setTitle("确定", forState:UIControlState.Normal)
        
        sureButton.layer.cornerRadius = 3
        
        sureButton.addTarget(self, action: Selector("sureButtonClciked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(sureButton)
        
        
    }
    
    func timeChangeAction() {
        
        self.verifyButton?.setTitle(String(self.timeNum!) + "秒后重新获取", forState: UIControlState.Normal)
        self.timeNum? -= 1
        if self.timeNum == 0 {
            self.timer?.invalidate()
            self.timer = nil
            self.timeNum = 60
            
            self.verifyButton?.setTitle("获取验证码", forState: UIControlState.Normal)
            self.verifyButton?.userInteractionEnabled = true
            self.verifyButton?.backgroundColor = UIColor.blueColor()
        }
    }
    
    
    func sureButtonClciked() {
        
        let passWord : NSString = (self.passWordTF?.text)!
        let affirm : NSString = (self.affirmTF?.text)!
        if self.passWordIsTrue(passWord, affirm: affirm) {
            
        } else {
            return
        }
        
        AVOSCloud.verifySmsCode(self.verifyTF?.text, mobilePhoneNumber: self.userNameTF?.text) { (succeed, error) -> Void in
            if succeed {
                let user = AVUser()
                user.username = self.userNameTF?.text
                user.password = self.passWordTF?.text
                user.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                    if succeed {
                        let file = AVFile(name:"headerImage", data: self.headerImageData)
                        file.saveInBackgroundWithBlock({ (succeed, error) -> Void in
                            if succeed {
                                let object = AVObject(className:"userSinceTab")
                                    object.setObject(file, forKey: "headerImage")
                                    object.setObject(user.objectId, forKey: "UID")
                                    
                                    object.saveInBackgroundWithBlock({ (succeed, error) -> Void in
                                        if succeed {
                                            let userSinceVC = UserSinceViewController()
                                            self.presentViewController(userSinceVC, animated: true, completion: { () -> Void in
                                            userSinceVC.currentUser = user
                                            })
                                        } else {
                                            print(error)
                                        }
                                    })
                            } else {
                                print(error)
                            }
                        })
                        
                    } else {
                        self.showAlert("注册失败，请检查网络")
                    }
                })
            } else {
                self.showAlert("验证失败，请重新输入验证码")
            }
        }
    }
    
    func verifyButtonClciked() {
        AVOSCloud.requestSmsCodeWithPhoneNumber(self.userNameTF?.text, appName: "亲", operation:"要服务么？", timeToLive: 60) { (succeed, error) -> Void in
            if succeed {
                self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timeChangeAction"), userInfo: nil, repeats: true)
                self.timer?.fire()
                self.verifyButton?.userInteractionEnabled = false
                self.verifyButton?.backgroundColor = UIColor.grayColor()
            } else {
                print(error)
                self.showAlert("获取验证码失败，请稍候尝试")
            }
        }
    }
    
  
    
    func headerButtonClciked() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            
        }
        
        let albumAction = UIAlertAction(title: "相册", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.imagePickerType(UIImagePickerControllerSourceType.PhotoLibrary)
        }
        
        let cameraAction = UIAlertAction(title: "相机", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.imagePickerType(UIImagePickerControllerSourceType.Camera)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(albumAction)
        alert.addAction(cameraAction)
        
        self.presentViewController(alert, animated: true) { () -> Void in
            
        }
    }
    
    func imagePickerType(type : UIImagePickerControllerSourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.editing = true
        picker.allowsEditing = true
        picker.delegate = self
        
        self.presentViewController(picker, animated: true) { () -> Void in
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.headerButton?.setImage(image, forState: UIControlState.Normal)
        
        self.headerImageData = UIImageJPEGRepresentation(image, 0.5)
        
        self.headerButton?.imageView?.layer.cornerRadius = (self.headerButton?.imageView?.frame.size.height)! / 2
        picker.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        let passWord : NSString = (self.passWordTF?.text)!
        let affirm : NSString = (self.affirmTF?.text)!
        
        if textField == self.affirmTF {
           self.passWordIsTrue(passWord, affirm: affirm)
        }
    }
    
    func passWordIsTrue(passWord : NSString, affirm : NSString) -> Bool {
        if passWord.length != 0 && affirm != 0 && passWord == affirm {
            return true
        } else {
            self.showAlert("两次密码输入的不一致，请重新输入")
            self.affirmTF?.text = nil
            
            return false
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
