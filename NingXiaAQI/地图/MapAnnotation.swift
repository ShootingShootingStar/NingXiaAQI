//
//  MapAnnotationView.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/6.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///自己定义的地图标注 
class MapAnnotation: BMKPointAnnotation {
    
    var dic:(key: Any, value: Any)?{
        didSet{
            if let  d = dic{
                let list = d.value as! NSDictionary
                
                let lon = (list["经度"]  as! NSString).doubleValue
                let lat = (list["纬度"]  as! NSString).doubleValue
                self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            }
        }
    }
    override init() {
        super.init()
        
    } 
}
