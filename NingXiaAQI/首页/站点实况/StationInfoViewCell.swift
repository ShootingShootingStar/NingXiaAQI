//
//  StationInfoViewCell.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/7.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit
///站点实况Info
class StationInfoViewCell: UITableViewCell {

    ///底部容器
    private lazy var baseView:UIView = UIView()
    ///AQI文字
    private lazy var lbaqi:UILabel = UILabel(title:"160", fontSize: 18)
    ///等级描述
    private lazy var lbDesc:UILabel = UILabel(title:" 优 ", fontSize: 13)
    ///站点名称
    private lazy var lbStationName:UILabel = UILabel(title:"监测站1", fontSize: 13)
    ///首要污染物
    private lazy var lbpp:UILabel = UILabel(title: "首要污染物:细颗粒物（PM10）", fontSize: 13)
    ///分割线
    private lazy var line:UIView = UIView()
    ///PM2.5
    private lazy var lbpm25:UILabel = UILabel(title: "PM25：69", fontSize: 13)
    ///so2
    private lazy var lbso2:UILabel = UILabel(title: "So2：200", fontSize: 13)
    ///o3
    private lazy var lbo3:UILabel = UILabel(title: "O3：67", fontSize: 13)
    ///PM10
    private lazy var lbpm10:UILabel = UILabel(title: "PM10：116", fontSize: 13)
    ///no2
    private lazy var lbno2:UILabel = UILabel(title: "No2：100", fontSize: 13)
    ///co
    private lazy var lbco:UILabel = UILabel(title: "Co：36", fontSize: 13)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        
        self.backgroundColor = UIColor.Base_mask
        baseView.backgroundColor = UIColor.white
        self.addSubview(baseView)
        baseView.snp.makeConstraints { (make) in
            make.top.right.left.equalTo(self)
            make.bottom.equalTo(self).offset(-10)
        }
        baseView.addSubview(lbaqi)
        lbaqi.backgroundColor = UIColor.Base_mask
        lbaqi.textColor = UIColor.You
        lbaqi.setConrner(radius: 20)
        lbaqi.textAlignment = .center
        lbaqi.font = UIFont.boldSystemFont(ofSize: 18)
        lbaqi.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 40, height: 40))
            make.left.top.equalTo(baseView).offset(10)
        }
        baseView.addSubview(lbDesc)
        lbDesc.setConrner(radius: 5)
        lbDesc.textColor = UIColor.white
        lbDesc.backgroundColor = UIColor.You
        lbDesc.snp.makeConstraints { (make) in
            make.left.equalTo(lbaqi.snp.right).offset(10)
            make.top.equalTo(lbaqi)
        }
        baseView.addSubview(lbStationName)
        lbStationName.snp.makeConstraints { (make) in
            make.right.equalTo(baseView).offset(-10)
            make.centerY.equalTo(lbDesc)
        }
        baseView.addSubview(lbpp)
        lbpp.snp.makeConstraints { (make) in
            make.left.equalTo(lbDesc)
            make.bottom.equalTo(lbaqi)
        }
        baseView.addSubview(line)
        line.backgroundColor = UIColor.Base
        line.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.width.equalTo(baseView).multipliedBy(0.95)
            make.centerX.equalTo(baseView)
            make.top.equalTo(lbaqi.snp.bottom).offset(10)
        }
        //********污染物****************
        let ppwidth = (ScreenWidth - 20) / 3
        baseView.addSubview(lbpm25)
        lbpm25.snp.makeConstraints { (make) in
            make.width.equalTo(ppwidth)
            make.top.equalTo(line).offset(10)
            make.left.equalTo(baseView).offset(10)
        }
        baseView.addSubview(lbso2)
        lbso2.textAlignment = .center
        lbso2.snp.makeConstraints { (make) in
            make.width.top.equalTo(lbpm25)
            make.left.equalTo(lbpm25.snp.right)
            
        }
        baseView.addSubview(lbo3)
        lbo3.textAlignment = .right
        lbo3.snp.makeConstraints { (make) in
            make.width.top.equalTo(lbpm25)
            make.right.equalTo(baseView).offset(-10)
        }
        //下层污染物
        baseView.addSubview(lbpm10)
        lbpm10.snp.makeConstraints { (make) in
            make.width.equalTo(ppwidth)
            make.top.equalTo(lbpm25.snp.bottom).offset(5)
            make.left.equalTo(baseView).offset(10)
        }
        baseView.addSubview(lbno2)
        lbno2.textAlignment = .center
        lbno2.snp.makeConstraints { (make) in
            make.width.top.equalTo(lbpm10)
            make.left.equalTo(lbpm10.snp.right)
            
        }
        baseView.addSubview(lbco)
        lbco.textAlignment = .right
        lbco.snp.makeConstraints { (make) in
            make.width.top.equalTo(lbpm10)
            make.right.equalTo(baseView).offset(-10)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
