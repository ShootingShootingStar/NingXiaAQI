//
//  UIimage+Extension.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/6.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

extension UIImage{
    ///根据AQI数值返回marker图标
    convenience init(aqi:Int){
        
        if 0 < aqi && aqi < 51{
            self.init(named: "mk_you")!
        }else if 51 < aqi && aqi < 101{
           self.init(named: "mk_liang")!
        }else if 101 < aqi && aqi < 151{
            self.init(named: "mk_qingdu")!
        }else if 151 < aqi && aqi < 201{
            self.init(named: "mk_zhongdu")!
        }else if 201 < aqi && aqi < 301{
            self.init(named: "mk_zhongdu!")!
        }else{
            self.init(named: "mk_yanzhong")!
        }
        
    }
}
