//
//  AddBriefTableViewCell.swift
//  ServiceShop
//
//  Created by yyg on 16/1/10.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

typealias mySinceBlock = (since : String) -> Void

class AddBriefTableViewCell: BaseTableViewCell, UITextViewDelegate {
    
    var sinceBlock : mySinceBlock? = nil
    var sinceTextView : UITextView? = nil
    var placeLabel : UILabel? = nil
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.sinceTextView = UITextView()
        self.placeLabel = UILabel()
        self.placeLabel?.text = "简介"
        self.sinceTextView?.delegate = self
        self.contentView.addSubview(self.sinceTextView!)
        self.contentView.addSubview(self.placeLabel!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.sinceTextView?.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        
        self.placeLabel?.frame = CGRectMake(0, 0, self.frame.size.width, 20)
        
        self.placeLabel?.sizeToFit()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        self.placeLabel?.hidden = true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        self.sinceBlock!(since : textView.text)
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
