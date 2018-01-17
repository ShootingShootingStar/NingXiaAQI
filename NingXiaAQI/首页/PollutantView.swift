//
//  PollutantView.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/2.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///一个污染物集合的Cell
class PollutantOneView: UIView {
    ///PM2.5浓度
    private lazy var lbPollutant:UILabel = UILabel(title: "PM2.5", fontSize: 15)
    ///PM2.5浓度
    private lazy var lbPollutantValue:UILabel = UILabel(title: "11μg/m³", fontSize: 13)
   
    init(pollutant:String,pollutantValue:String) {
        super.init(frame: CGRect.zero)
        
        self.lbPollutant.text = pollutant
        self.lbPollutantValue.text = pollutantValue
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///重写布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }
    
    func setup(){
        
        self.addSubview(lbPollutant)
        lbPollutant.textColor = UIColor.white
        lbPollutant.snp.makeConstraints { (make) in
           make.centerX.equalTo(self)
           make.top.equalTo(self)
        }
        self.addSubview(lbPollutantValue)
        lbPollutantValue.textColor = UIColor.white
        lbPollutantValue.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(lbPollutant.snp.bottom).offset(5)
        }
    }
    
}

///污染物集合视图
class PollutantView: UIView {
    
    ///pm2.5
    private lazy var pm25:PollutantOneView = PollutantOneView(pollutant: "PM2.5", pollutantValue: "35μg/m³")
    ///pm10
    private lazy var pm10:PollutantOneView = PollutantOneView(pollutant: "PM10", pollutantValue: "35μg/m³")
    ///no2
    private lazy var no2:PollutantOneView = PollutantOneView(pollutant: "No2", pollutantValue: "35μg/m³")
    ///分割线
    private lazy var line:UIView = UIView()
    ///so2
    private lazy var so2:PollutantOneView = PollutantOneView(pollutant: "so2", pollutantValue: "35μg/m³")
    ///o3
    private lazy var o3:PollutantOneView = PollutantOneView(pollutant: "o3", pollutantValue: "35μg/m³")
    ///co
    private lazy var co:PollutantOneView = PollutantOneView(pollutant: "co", pollutantValue: "35μg/m³")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup() 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        let width = ScreenWidth / 3
        let height:CGFloat = 50
        
        self.addSubview(pm25)
        pm25.snp.makeConstraints { (make) in
            make.top.left.equalTo(self)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        self.addSubview(pm10)
        pm10.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(pm25.snp.right)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        self.addSubview(no2)
        no2.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(pm10.snp.right)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        self.addSubview(line)
        line.backgroundColor = UIColor.white
        line.snp.makeConstraints { (make) in
            make.top.equalTo(pm25.snp.bottom)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
        self.addSubview(so2)
        so2.snp.makeConstraints { (make) in
            make.centerX.equalTo(pm25)
            make.top.equalTo(line.snp.bottom).offset(5)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        self.addSubview(o3)
        o3.snp.makeConstraints { (make) in
            make.centerX.equalTo(pm10)
            make.top.equalTo(line.snp.bottom).offset(5)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        self.addSubview(co)
        co.snp.makeConstraints { (make) in
            make.centerX.equalTo(no2)
            make.top.equalTo(line.snp.bottom).offset(5)
            make.size.equalTo(CGSize(width: width, height: height))
        }
    }
}
