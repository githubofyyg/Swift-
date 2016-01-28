//
//  PhotoCollectionViewCell.swift
//  ServiceShop
//
//  Created by yyg on 16/1/10.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit

typealias photoBlock = () -> Void

class PhotoCollectionViewCell: BaseCollectionViewCell {
    var myPhotoBlock : photoBlock? = nil
    
    var chooseButton : UIButton? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.chooseButton = UIButton(type:UIButtonType.Custom)
        self.chooseButton?.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        
        self.chooseButton?.addTarget(self, action: Selector("chooseButtonClciked"), forControlEvents: UIControlEvents.TouchUpInside)
        self.contentView.addSubview(self.chooseButton!)
        
    }
    
    func chooseButtonClciked() {
        self.myPhotoBlock!()
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
