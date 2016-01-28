//
//  AddPhotoTableViewCell.swift
//  ServiceShop
//
//  Created by yyg on 16/1/10.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit


class AddPhotoTableViewCell: BaseTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var collectionView : UICollectionView? = nil
    var imageArr : NSMutableArray? = nil
    var myVC  : UIViewController? = nil
    var imagePickerVC : UIImagePickerController? = nil
    
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.imageArr = NSMutableArray()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(100, 100)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        self.collectionView = UICollectionView(frame: CGRectMake(0, 0, 0, 0), collectionViewLayout: flowLayout)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.collectionView?.registerClass(PhotoCollectionViewCell.self, forCellWithReuseIdentifier:"CELL")
        self.contentView.addSubview(self.collectionView!)

    
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.imageArr?.count == 9 {
            return (self.imageArr?.count)!
        } else {
            return (self.imageArr?.count)! + 1
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CELL", forIndexPath: indexPath) as! PhotoCollectionViewCell
        if indexPath.row == (self.imageArr?.count)! {
            cell.chooseButton?.setImage(UIImage(named:"iconfont-tianjia"), forState: UIControlState.Normal)
        } else  {
            if self.imageArr?.count == 0 {
                cell.chooseButton?.setImage(UIImage(named:"iconfont-tianjia"), forState: UIControlState.Normal)

            } else {
                cell.chooseButton?.setImage(self.imageArr![indexPath.row] as? UIImage, forState:UIControlState.Normal)
            }
        }
        cell.myPhotoBlock = { () -> Void in
       
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
            
            self.myVC!.presentViewController(alert, animated: true) { () -> Void in
                
            }


        }
        
        return cell
    }
    
    func imagePickerType(type : UIImagePickerControllerSourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.editing = true
        picker.allowsEditing = true
        picker.delegate = self
        
        self.myVC!.presentViewController(picker, animated: true) { () -> Void in
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imageArr?.addObject(image)
        self.collectionView?.reloadData()
        picker.dismissViewControllerAnimated(true, completion:nil)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView?.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
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
