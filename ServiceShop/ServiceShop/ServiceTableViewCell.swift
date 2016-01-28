//
//  ServiceTableViewCell.swift
//  ServiceShop
//
//  Created by yyg on 16/1/8.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class ServiceTableViewCell: BaseTableViewCell {
    
    var headerImage : UIImageView? = UIImageView()
    var titleLabel : UILabel? = UILabel()
    var statusLabel : UILabel? = UILabel()
    var timeLabel : UILabel? = UILabel()
    var priceLabel : UILabel? = UILabel()
    

    override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.headerImage = UIImageView()
        //self.headerImage?.image = UIImage(named: "headerIamage.jpg")
        self.headerImage?.backgroundColor = UIColor.blueColor()
        self.contentView.addSubview(self.headerImage!)
        
        self.titleLabel = UILabel()
        //self.titleLabel?.text = "解决问题"
        self.titleLabel?.backgroundColor = UIColor.redColor()
        self.contentView.addSubview(self.titleLabel!)
        
        self.statusLabel = UILabel()
        //self.statusLabel?.text = "线上"
        self.statusLabel?.backgroundColor = UIColor.orangeColor()
        self.contentView.addSubview(self.statusLabel!)
        
        self.timeLabel = UILabel()
        //self.timeLabel?.text = "2015-01-08"
        self.timeLabel?.font = UIFont.systemFontOfSize(12)
        //self.timeLabel?.textColor = UIColor.greenColor()
        self.timeLabel?.backgroundColor = UIColor.greenColor()
        self.contentView.addSubview(self.timeLabel!)
        
        self.priceLabel = UILabel()
        //self.priceLabel?.text = "¥1000"
        self.priceLabel?.backgroundColor = UIColor.cyanColor()
        self.priceLabel?.textColor = UIColor.redColor()
        self.contentView.addSubview(self.priceLabel!)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.headerImage?.frame = CGRectMake(10, 5, 100, 100)
        self.headerImage?.image = UIImage(named: "小炮.png")
        self.titleLabel?.frame = CGRectMake(115, 5, self.frame.size.width - 115, 20)
        self.timeLabel?.frame = CGRectMake(115, self.frame.size.height - 25, (self.frame.size.width - 115) / 3, 20)
        //self.timeLabel?.sizeToFit()
        self.statusLabel?.frame = CGRectMake(CGRectGetMaxX((self.timeLabel?.frame)!),(self.timeLabel?.frame.origin.y)!,(self.frame.size.width - 115) / 3,20)
        self.priceLabel?.frame = CGRectMake(self.statusLabel!.frame.size.width + self.statusLabel!.frame.origin.x , (self.statusLabel?.frame.origin.y)!, (self.frame.size.width - 115) / 3, 20)
        
    }

    
    
    
    
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

}
