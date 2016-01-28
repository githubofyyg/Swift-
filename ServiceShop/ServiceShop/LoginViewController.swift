//
//  LoginViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/4.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit


class LoginViewController: BaseViewController {
    
    var userNameTF : UITextField? = nil
    var passWordTF : UITextField? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }
    
    
    override func createView() {
        let userNameTF = UITextField(frame:CGRectMake(10, 100, self.view.frame.size.width - 20, 40))
        
        userNameTF.placeholder = "请输入用户名"
        
        userNameTF.layer.borderWidth = 0.5
        
        userNameTF.textAlignment = NSTextAlignment.Center
        
        userNameTF.layer.cornerRadius = 3
        
        self.userNameTF = userNameTF
        
        self.view.addSubview(userNameTF)
        
        
        let passWordTF = UITextField(frame: CGRectMake(userNameTF.frame.origin.x, userNameTF.frame.size.height + userNameTF.frame.origin.y + 20, userNameTF.frame.size.width, userNameTF.frame.size.height))
        
        passWordTF.placeholder = "请输入密码"
        
        passWordTF.layer.cornerRadius = 4
        
        passWordTF.layer.borderWidth = 0.5
        
        passWordTF.textAlignment = NSTextAlignment.Center
        
        self.passWordTF = passWordTF
        
        self.view.addSubview(passWordTF)
        
        
        let loginButton = UIButton(type:UIButtonType.Custom)
        
        loginButton.setTitle("登录", forState: UIControlState.Normal)
        
        loginButton.frame = CGRectMake(passWordTF.frame.origin.x, passWordTF.frame.size.height + passWordTF.frame.origin.y + 20, passWordTF.frame.size.width, passWordTF.frame.size.height)
        
        loginButton.layer.cornerRadius = 4
        
        loginButton.backgroundColor = UIColor.blueColor()
        
        loginButton.addTarget(self, action: Selector("loginButtonClciked"), forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(loginButton)
        
        let registerButton = UIButton(type:UIButtonType.Custom)
        
        registerButton.frame = CGRectMake(loginButton.frame.size.width + loginButton.frame.origin.x - 120, loginButton.frame.size.height + loginButton.frame.origin.y + 10, 120, 20)
        
        registerButton.titleLabel?.font = UIFont.systemFontOfSize(13)
        
        registerButton.setTitle("没有账号？去注册", forState: UIControlState.Normal)
        
        registerButton.titleLabel?.textAlignment = NSTextAlignment.Right
        
        registerButton.layer.cornerRadius = 3
        
        registerButton.setTitleColor(UIColor.grayColor().colorWithAlphaComponent(0.5), forState: UIControlState.Normal)
        registerButton.addTarget(self, action: Selector("registerButtonClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(registerButton)
        
    }
    
    func registerButtonClicked() {
        let registerVC = RegisterViewController()
        self.presentViewController(registerVC, animated: true) { () -> Void in
            
        }
    }
    
    func loginButtonClciked() {
        let since = UserSinceViewController()
        self.presentViewController(since, animated: true) { () -> Void in
            
        }
        
        AVUser.logInWithUsernameInBackground(self.userNameTF?.text, password: self.passWordTF?.text) { (user, error) -> Void in
            if (user != nil) {
                            
            } else {
                print(error)
            }
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
