//
//  AirLevelModel.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

struct AirLevelModel {
    
    var level:String
    
    var value:String
    
    var desc:String
    
    var baseColor:UIColor
    
    var levelColor:UIColor
    
 /// 空气污染级别说明的model
 ///
 /// - Parameters:
 ///   - level: 等级
 ///   - value: 数值
 ///   - desc: 说明文字
 ///   - maskColor: 左边圆圈颜色
 ///   - baseColor: 右边底色
 init(level:String,value:String,desc:String,levelColor:UIColor,baseColor:UIColor) {
        
        self.level = level
        self.value = value
        self.desc = desc
        self.levelColor = levelColor
        self.baseColor = baseColor
    }
}
