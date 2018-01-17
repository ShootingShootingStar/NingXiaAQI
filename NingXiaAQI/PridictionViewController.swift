//
//  PridictionViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/10.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit
///预报页面
class PridictionViewController: UIViewController {

    private lazy var segment:UISegmentedControl = {
        let seg = UISegmentedControl(items: ["01-10","01-11","01-12"])
        return seg
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup()
    {
        self.view.backgroundColor = UIColor.white 
        
        self.navigationController?.navigationItem.titleView = segment
        
        segment.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.width.equalTo(self.view)
            make.left.equalTo(0)
        }
        
    }

    

}
