//
//  CityManageAddViewCell.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///那个添加Cell
class CityManageAddViewCell: CityManageViewCell {
    
    private lazy var imgAdd:UIImageView = UIImageView(image: UIImage(named:"cityAdd"))
    
    override func setup() {
        
        self.addSubview(baseView)
        baseView.backgroundColor = UIColor.white
        baseView.layer.cornerRadius = 5
        baseView.snp.makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.8)
            make.height.equalTo(self).multipliedBy(0.8)
            make.center.equalTo(self)
        }
        
        baseView.addSubview(imgAdd)
        imgAdd.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 32, height: 32))
            make.center.equalTo(baseView)
        }
    }
    
}
