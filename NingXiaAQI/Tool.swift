//
//  Tool.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/25.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit

//MARK:记录一些常量
///本地的版本号
private let SLBundleShortVersionString = "SLBundleShortVersionString"

///应用程序的关键窗口
let KeyWindow = UIApplication.shared.keyWindow!
///屏幕的宽度
let ScreenWidth:CGFloat =  UIScreen.main.bounds.width
///屏幕有的高度
let ScreenHeight:CGFloat = UIScreen.main.bounds.height
///底部tab高度
let TabHeight:CGFloat = 49
///导航高度
let NavigationHeight:CGFloat = 64

//let ColorPrimary = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)

///工具类杂七杂八的方法都写在这里，都是类方法
class Tool{
    ///判断是否要进入新特性页面，是否有新版本
    class func IsNewFeature()->Bool{
        // 根据版本号来确定是否进入新特性界面
        let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        let oldVersion = UserDefaults.standard.string(forKey: SLBundleShortVersionString) ?? ""
        
        // 如果当前的版本号和本地保存的版本比较是降序, 则需要显示新特性
        if (currentVersion.compare(oldVersion)) == .orderedDescending{
            // 保存当前的版本
            UserDefaults.standard.set(currentVersion, forKey: SLBundleShortVersionString)
            return true
        }
        return false
    }
}
