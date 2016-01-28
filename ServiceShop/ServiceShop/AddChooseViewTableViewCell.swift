//
//  AddChooseViewTableViewCell.swift
//  ServiceShop
//
//  Created by yyg on 16/1/10.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

typealias myChooseBlock = (index : Int) -> Void

class AddChooseViewTableViewCell: BaseTableViewCell {
    
    var chooseView : ChooseView? = nil
    var mapView : UIView? = nil
    var chooseBlock : myChooseBlock? = nil
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if self.chooseView == nil {
            self.chooseView = ChooseView()
            self.chooseView?.setLeftAndRightTitle("选择服务地点", leftTitle:"线上", rightTitle:"线下")
        }
        self.mapView = UIView()
        self.mapView?.hidden = true
        self.mapView?.backgroundColor = UIColor.redColor()
        self.contentView.addSubview(self.chooseView!)
        self.contentView.addSubview(self.mapView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.chooseView?.frame.size.height != 44 {
            self.chooseView?.frame = CGRectMake(0, 0, self.frame.size.width, 44)
        }
        if self.frame.size.height != 44 {
            self.mapView?.frame = CGRectMake(0, 44, self.frame.size.width, self.frame.size.height - 44)
            self.mapView?.hidden = false
        } else {
            self.mapView?.hidden = true
        }
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
