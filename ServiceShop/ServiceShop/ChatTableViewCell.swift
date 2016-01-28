//
//  ChatTableViewCell.swift
//  ServiceShop
//
//  Created by yyg on 16/1/7.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

class ChatTableViewCell: BaseTableViewCell {
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.layer.cornerRadius = (self.imageView?.frame.size.height)! / 2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
