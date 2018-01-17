//
//  UIView+Extension.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/2.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

extension UIView{
    ///调试用 +上边框
    func debugAddBorder(){
        
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
    }
    ///
    /// 任意角圆角，注意要卸载layoutsubview上
    ///
    /// - Parameters:
    ///   - radius: 圆角大小
    ///   - con: 都有哪个角
    func setCorners(radius:CGFloat,con:UIRectCorner){
        let corners: UIRectCorner = con
        // 或者设置所有圆角.allCorners
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.frame = bounds
        
        self.layer.mask = maskLayer
    }
    
    /// 给View上圆角
    ///
    /// - Parameter radius: 圆角大小
    func setConrner(radius:CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
     
}
