//
//  BaseViewController.swift
//  ServiceShop
//
//  Created by yyg on 16/1/4.
//  Copyright © 2016年 yyg. All rights reserved.
//

import UIKit
import CoreLocation
//ios 8.0 需要在plist文件里设置字段，提示定位


class BaseViewController: UIViewController,CLLocationManagerDelegate {

    
    var location : CLLocationManager? = nil
    var geoCoder : CLGeocoder? = nil
    var currentCity : String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        createView()
        
        self.location = CLLocationManager()
        self.location?.delegate = self
        self.location?.requestAlwaysAuthorization()
        self.location?.startUpdatingLocation()
        
        self.geoCoder = CLGeocoder()
     
    }
    
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        let location = locations.first
//        
//        self.geoCoder?.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) -> Void in
//            
//            if error != nil{
//                self.showAlert("定位失败")
//            }else{
//                
//               let placemark = placemarks?.first
//                //print(placemark)
//                self.currentCity = placemark!.locality
//                self.location?.stopUpdatingLocation()
//                self.showAlert("定位成功")
//            }
//            
//        })
//        
//        
//    }
//    
    func createView() {
        
    }
    
    func showAlert(title : String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        self.presentViewController(alert, animated: true) { () -> Void in
            
        }
        
        let queue = dispatch_get_global_queue(0, 0)
        
        dispatch_after(1, queue) { () -> Void in
            alert.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
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
