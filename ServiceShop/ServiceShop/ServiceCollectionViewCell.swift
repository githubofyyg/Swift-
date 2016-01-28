//
//  ServiceCollectionViewCell.swift
//  ServiceShop
//
//  Created by yyg on 16/1/8.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class ServiceCollectionViewCell: BaseCollectionViewCell {
    
    var headerImageView : UIImageView? = nil
    var titleLabel : UILabel? = nil
    var statusLabel : UILabel? = nil
    var timeLabel : UILabel? = nil
    var priceLabel : UILabel? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.headerImageView = UIImageView()
        self.headerImageView?.image = UIImage(named:"headerIamage.jpg")
        self.contentView.addSubview(self.headerImageView!)
        
        self.titleLabel = UILabel()
        self.titleLabel?.text = "解决问题"
        self.contentView.addSubview(self.titleLabel!)
        
        self.statusLabel = UILabel()
        self.statusLabel?.text = "线上"
        self.contentView.addSubview(self.statusLabel!)
        
        self.timeLabel = UILabel()
        self.timeLabel?.text = "2016-01-11"
        self.contentView.addSubview(self.timeLabel!)
        
        self.priceLabel = UILabel()
        self.priceLabel?.text = "¥1000"
        self.priceLabel?.textColor = UIColor.redColor()
        self.contentView.addSubview(self.priceLabel!)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.headerImageView?.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        
        self.titleLabel?.frame = CGRectMake(0, self.frame.size.height - 40, 100, 20)
        
        self.titleLabel?.sizeToFit()
        self.titleLabel?.frame = CGRectMake(0, self.titleLabel!.frame.origin.y, self.titleLabel!.frame.size.width, 20)
        
        self.statusLabel?.frame = CGRectMake(self.titleLabel!.frame.size.width + self.titleLabel!.frame.origin.x + 10, (self.titleLabel?.frame.origin.y)!, self.frame.size.width - self.titleLabel!.frame.size.width - self.titleLabel!.frame.origin.x - 10, 20)
        
        self.timeLabel?.frame = CGRectMake(0, self.frame.size.height - 20, 100, 20)
        self.timeLabel?.sizeToFit()
        self.timeLabel?.frame = CGRectMake(0, self.frame.size.height - 20, self.timeLabel!.frame.size.width, 20)
        
        self.priceLabel?.frame = CGRectMake(self.timeLabel!.frame.size.width + self.timeLabel!.frame.origin.x + 10, self.frame.size.height - 20, self.frame.size.width - self.timeLabel!.frame.size.width - self.timeLabel!.frame.origin.x - 10, 20)
    
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
