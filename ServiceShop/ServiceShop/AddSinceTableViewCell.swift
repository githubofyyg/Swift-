//
//  AddSinceTableViewCell.swift
//  ServiceShop
//
//  Created by yyg on 16/1/10.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

typealias myBlock = (since : String) -> Void

class AddSinceTableViewCell: BaseTableViewCell, UITextFieldDelegate {
    
    var sinceBlock : myBlock? = nil
    
    var titleLabel : UILabel? = nil
    var sinceTextField : UITextField? = nil
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.titleLabel = UILabel()
        self.sinceTextField = UITextField()
        
        self.contentView.addSubview(self.titleLabel!)
        self.contentView.addSubview(self.sinceTextField!)
        self.sinceTextField?.delegate = self
    }
    
    func setTitle(labelTitle : String, textFieldPlace : String) {
        self.titleLabel?.text = labelTitle
        self.sinceTextField?.placeholder = textFieldPlace

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel?.frame = CGRectMake(0, 0, 100, self.frame.size.height)
        self.titleLabel?.sizeToFit()
        self.titleLabel?.frame = CGRectMake(0, 0, self.titleLabel!.frame.size.width, self.frame.size.height)
        
        self.sinceTextField?.frame = CGRectMake(self.titleLabel!.frame.size.width + self.titleLabel!.frame.origin.x + 10, 0, self.frame.size.width - self.titleLabel!.frame.origin.x - 10, self.frame.size.height)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.sinceBlock!(since : textField.text!)
        
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
