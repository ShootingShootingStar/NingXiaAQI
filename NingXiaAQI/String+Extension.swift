//
//  String+Extension.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/28.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit

extension String{
    
    ///空气质量描述文字 优
    var levelDesc:String{
        
        let aqi = Int(self) ?? 0
        var desc = ""
        if 0 < aqi && aqi < 51{
            desc = "优"
        }else if 51 < aqi && aqi < 101{
            desc = "良"
        }else if 101 < aqi && aqi < 151{
            desc = "轻度污染"
        }else if 151 < aqi && aqi < 201{
            desc = "中度污染"
        }else if 201 < aqi && aqi < 301{
            desc = "重度污染"
        }else{
           desc = "严重污染"
        }
        return desc
    }
    
    
}

