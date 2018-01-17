//
//  BaseNavigationViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/25.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit

///自己定义的导航窗体
class BaseNavigationViewController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(UIImage(named:"navigation"), for: .default)
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.barStyle = UIBarStyle.black
        
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            // push的时候, 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"back"), style: .done, target: self, action: #selector(BaseNavigationViewController.pushBack))
        }
        
        super.pushViewController(viewController, animated: true)
        
    }
 
    @objc func pushBack(){
          popViewController(animated: true)
    }

}
