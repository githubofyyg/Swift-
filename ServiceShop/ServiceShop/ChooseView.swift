//
//  ChooseView.swift
//  ServiceShop
//
//  Created by yyg on 16/1/6.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

typealias chooseBlock = (index : Int) -> Void

class ChooseView: UIView {

    var myChooseBlock : chooseBlock? = nil
    var titleLabel : UILabel? = nil
    var leftButton : UIButton? = nil
    var rightButton : UIButton? = nil
    var selectedButton : UIButton? = nil
    var title : String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel = UILabel()
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        self.addSubview(self.titleLabel!)
        self.leftButton = UIButton(type:UIButtonType.Custom)
        self.leftButton?.tag = 0
        self.leftButton?.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(self.leftButton!)
        self.leftButton?.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.rightButton = UIButton(type: UIButtonType.Custom)
        self.rightButton?.tag = 1
        self.addSubview(self.rightButton!)
        self.rightButton?.addTarget(self, action: Selector("buttonClicked:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.rightButton?.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)

    }
    
    func buttonClicked(sender : UIButton) {
        
        self.selectedButton?.setImage(UIImage(named:"iconfont-kongxinyuan"), forState:UIControlState.Normal)
        self.selectedButton = sender
        self.selectedButton?.setImage(UIImage(named:"iconfont-yuandian"), forState:UIControlState.Normal)
        if self.myChooseBlock != nil {
            self.myChooseBlock!(index : sender.tag)
        }
    }
    
    func setLeftAndRightTitle(title : String, leftTitle title1 : String, rightTitle title2 : String) {
        self.titleLabel?.text = title
        self.rightButton?.setTitle(title2, forState: UIControlState.Normal)
        self.leftButton?.setTitle(title1, forState: UIControlState.Normal)
        self.leftButton?.setImage(UIImage(named: "iconfont-kongxinyuan"), forState: UIControlState.Normal)
        self.rightButton?.setImage(UIImage(named:"iconfont-kongxinyuan"), forState:UIControlState.Normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel?.frame = CGRectMake(0, 0, 100, self.frame.size.height)
        self.titleLabel?.sizeToFit()
        self.titleLabel?.frame = CGRectMake(0, 0, self.titleLabel!.frame.size.width, self.frame.size.height)
        let f : CGFloat = (self.titleLabel?.frame.size.width)! + (self.titleLabel?.frame.origin.x)! + 10
        self.leftButton?.frame = CGRectMake(f, 0, (self.frame.size.width - f) / 2, self.frame.size.height)
        self.rightButton?.frame = CGRectMake(self.leftButton!.frame.size.width + self.leftButton!.frame.origin.x, 0, self.leftButton!.frame.size.width, self.frame.size.height)
    }
    
    func loadSelectedButton() -> Int {
        return (self.selectedButton?.tag)!
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
