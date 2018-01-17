//
//  MainViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/25.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit

///主页。tab 页面
class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

         setup()
         //让默认选择到主页
         self.selectedIndex = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        
        addViewController(childController: PridictionViewController(), title: "预报", normalImageName: "tab_yb", highLightImageName: "tab_yb_high")
        
         addViewController(childController: MapViewController(), title: "地图", normalImageName: "tab_map", highLightImageName: "tab_map_high")
        
         addViewController(childController: HomeViewController(), title: "主页", normalImageName: "tab_home", highLightImageName: "tab_home_high")
        
         addViewController(childController: UIViewController(), title: "日报", normalImageName: "tab_day", highLightImageName: "tab_day_high")
        
         addViewController(childController: UIViewController(), title: "趋势", normalImageName: "tab_qs", highLightImageName: "tab_qs_high")
        
        
    }
    
    /// 添加子窗体到主Tab上面
    ///
    /// - Parameters:
    ///   - childController: 子窗体的类
    ///   - title: 标题
    ///   - normalImageName: 正常状态下的图片名字
    ///   - highLightImageName: 高亮状态下的图片名字
    private func addViewController(childController: UIViewController, title: String,normalImageName:String,highLightImageName:String){
        
        let nav = BaseNavigationViewController(rootViewController: childController)
        addChildViewController(nav)
        childController.title = title
        childController.tabBarItem.image = UIImage(named:normalImageName)
        childController.tabBarItem.selectedImage = UIImage(named:highLightImageName)
        childController.tabBarItem.tag = childViewControllers.count-1 
        
    }

}
