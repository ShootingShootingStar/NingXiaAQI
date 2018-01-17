//
//  UIColor+Extension.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/28.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit

extension UIColor{
    
    ///自己封装的初始化方法
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat=1){
        
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    ///根据AQI数值返回颜色
    convenience init(aqi:Int){
        
        if 0 < aqi && aqi < 51{
            self.init(r: 0, g: 255, b: 0)
        }else if 51 < aqi && aqi < 101{
            self.init(r: 255, g: 255, b: 1)
        }else if 101 < aqi && aqi < 151{
            self.init(r: 255, g: 100, b: 0)
        }else if 151 < aqi && aqi < 201{
            self.init(r: 255, g: 0, b: 0)
        }else if 201 < aqi && aqi < 301{
            self.init(r: 133, g: 0, b: 60)
        }else{
            self.init(r: 100, g: 0, b: 30)
        }
        
    }
    
    /// 根据AQI数值返回mask颜色
    ///
    /// - Parameter aqiMask: AQI数值
    convenience init(aqiMask:Int){
        
        if 0 < aqiMask && aqiMask < 51{
            self.init(r: 0, g: 255, b: 0,a:0.3)
        }else if 51 < aqiMask && aqiMask < 101{
            self.init(r: 255, g: 100, b: 1,a:0.3)
        }else if 101 < aqiMask && aqiMask < 151{
            self.init(r: 255, g: 100, b: 1,a:0.3)
        }else if 151 < aqiMask && aqiMask < 201{
            self.init(r: 255, g: 0, b: 1,a:0.3)
        }else if 201 < aqiMask && aqiMask < 301{
            self.init(r: 133, g: 0, b: 60,a:0.3)
        }else{
            self.init(r: 100, g: 0, b: 30,a:0.3)
        }
        
    }
    
    ///基颜色
    class var Base:UIColor{
        return  UIColor(r: 230, g: 230, b: 230)
    }
    class var Base_mask:UIColor{
        return  UIColor(r: 240, g: 240, b: 240)
    }
    ///优的颜色
     class var You:UIColor{
        return  UIColor(r: 0, g: 255, b: 0)
    }
    ///优mask颜色
    class var You_mask:UIColor{
        return  UIColor(r: 0, g: 255, b: 0,a:0.3)
    }
    ///良的颜色
    class var Liang:UIColor{
        return  UIColor(r: 255, g: 255, b: 1)
    }
    ///良mask颜色
    class var Liang_mask:UIColor{
        return  UIColor(r: 255, g: 255, b: 1,a:0.3)
    }
    ///轻度污染的颜色
    class var QingDuWuRan:UIColor{
        return  UIColor(r: 255, g: 100, b: 1)
    }
    ///轻度污染mask颜色
    class var QingDuWuRan_mask:UIColor{
        return  UIColor(r: 255, g: 100, b: 1,a:0.3)
    }
    ///中度污染的颜色
    class var ZhongDuWuRan:UIColor{
        return  UIColor(r: 255, g: 0, b: 1)
    }
    ///中度污染mask颜色
    class var ZhongDuWuRan_mask:UIColor{
        return  UIColor(r: 255, g: 0, b: 1,a:0.3)
    }
    ///重度污染的颜色
    class var ZhongDuWuRan_:UIColor{
        return  UIColor(r: 133, g: 0, b: 60)
    }
    ///重度污染mask颜色
    class var ZhongDuWuRan__mask:UIColor{
        return  UIColor(r: 133, g: 0, b: 60,a:0.3)
    }
    ///严重污染的颜色
    class var YanZhongWuRan:UIColor{
        return  UIColor(r: 100, g: 0, b: 30)
    }
    ///严重污染的颜色
    class var YanZhongWuRan_mask:UIColor{
        return  UIColor(r: 100, g: 0, b: 30,a:0.3)
    }
}


