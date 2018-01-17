//
//  CityAQIView.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/2.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit
///首页上面的城市以及AQI模块的代理，
protocol CityAQIViewDelegate {
    
    /// 代理方法，点击了城市名字按钮
    ///
    /// - Parameter sender: 点击的对象
    func CityNameSelected(sender:UIButton)
}

///首页上面的城市以及AQI模块
class CityAQIView: UIView {
    
    var delegate:CityAQIViewDelegate?
    ///城市名称
    private lazy var btnCityName:UIButton =  {
        let  btn = UIButton()
        btn.setTitle("城市 >", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.titleLabel?.textColor = UIColor.white
        btn.addTarget(self, action: #selector(cityNameSelected(sender:)), for: .touchUpInside)
        return btn
    }()
    ///指示文字
    private lazy var lbTip:UILabel = UILabel(title: "空气质量指数/AQI", fontSize: 20)
    ///AQI文字
    private lazy var lbAQI:UILabel = UILabel(title: "380", fontSize: 50)
    ///AQI等级描述文字
    private lazy var lbAQIDesc:UILabel = UILabel(title: "优", fontSize: 15)
    ///更新时间
    private lazy var lbUpdateTime:UILabel = UILabel(title: "更新于12-30 00:00", fontSize: 12)
    ///首要污染物
    private lazy var lbPollutant:UILabel = UILabel(title: "首要污染物：颗粒物(PM10)", fontSize: 13)
    ///月排行图标
    private lazy var imgLeafMonth:UIImageView = UIImageView(image:UIImage(named:"leafMonth"))
    ///月排行文字
    private lazy var lbMonthLabel:UILabel = UILabel(title: "本月优良：0|0", fontSize: 13)
    ///年排行图标
    private lazy var imgLeafYear:UIImageView = UIImageView(image:UIImage(named:"leafYear"))
    ///年排行文字
    private lazy var lbYearLabel:UILabel = UILabel(title: "本年优良：0|0", fontSize: 13)
    ///城市排行图标
    private lazy var imgCitySort:UIImageView = UIImageView(image:UIImage(named:"citysort"))
    ///城市排行文字
    private lazy var lbCitySortLabel:UILabel = UILabel(title: "城市排名：1|6", fontSize: 13)
    ///向右箭头
    private lazy var rightBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"rightbutton"), for: .normal)
        return btn
    }()
    ///AQI小娃娃指示图，这个可以做成GIF
    private lazy var childView:UIImageView = UIImageView(image: UIImage(named:"you"))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.addSubview(btnCityName)
        
        btnCityName.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(20)
        }
        
        self.addSubview(lbTip)
        lbTip.textColor = UIColor(r: 80, g: 30, b: 100)
        lbTip.snp.makeConstraints { (make) in
            make.left.equalTo(btnCityName)
            make.top.equalTo(btnCityName.snp.bottom).offset(10)
        }
        self.addSubview(lbAQI)
        lbAQI.textColor = UIColor(aqi: Int(lbAQI.text ?? "0") ?? 0 )
        lbAQI.snp.makeConstraints { (make) in
            make.left.equalTo(lbTip)
            make.top.equalTo(lbTip.snp.bottom).offset(10)
        }
        self.addSubview(lbAQIDesc)
        lbAQIDesc.text = lbAQI.text?.levelDesc
        lbAQIDesc.backgroundColor = UIColor(aqi: Int(lbAQI.text ?? "0") ?? 0 )
        lbAQIDesc.textColor = UIColor.white
        lbAQIDesc.textAlignment = .center
        lbAQIDesc.layer.cornerRadius = 5
        lbAQIDesc.clipsToBounds = true
        lbAQIDesc.snp.makeConstraints { (make) in
            make.top.equalTo(lbAQI)
            make.left.equalTo(lbAQI.snp.right).offset(10)
            make.width.equalTo(70)
        }
        self.addSubview(lbUpdateTime)
        lbUpdateTime.textColor = UIColor.white
        lbUpdateTime.snp.makeConstraints { (make) in
            make.left.equalTo(lbAQIDesc)
            make.bottom.equalTo(lbAQI).offset(-5)
        }
        self.addSubview(lbPollutant)
        lbPollutant.textColor = UIColor.white
        lbPollutant.snp.makeConstraints { (make) in
            make.left.equalTo(lbAQI)
            make.top.equalTo(lbAQI.snp.bottom).offset(5)
        }
        ///月排行，优良
        self.addSubview(imgLeafMonth)
        imgLeafMonth.snp.makeConstraints { (make) in
            make.left.equalTo(lbPollutant)
            make.top.equalTo(lbPollutant.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        self.addSubview(lbMonthLabel)
        lbMonthLabel.textColor = UIColor.white
        lbMonthLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgLeafMonth.snp.right).offset(5)
            make.centerY.equalTo(imgLeafMonth)
        }
        ///年排行，优良
        self.addSubview(imgLeafYear)
        imgLeafYear.snp.makeConstraints { (make) in
            make.left.equalTo(lbMonthLabel.snp.right).offset(5)
            make.top.equalTo(lbPollutant.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        self.addSubview(lbYearLabel)
        lbYearLabel.textColor = UIColor.white
        lbYearLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgLeafYear.snp.right).offset(5)
            make.centerY.equalTo(imgLeafYear)
        }
        ///城市排行
        self.addSubview(imgCitySort)
        imgCitySort.snp.makeConstraints { (make) in
            make.left.equalTo(imgLeafMonth)
            make.top.equalTo(lbMonthLabel.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        self.addSubview(lbCitySortLabel)
        lbCitySortLabel.textColor = UIColor.white
        lbCitySortLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgCitySort.snp.right).offset(5)
            make.centerY.equalTo(imgCitySort)
        }
        ///向右箭头
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.left.equalTo(lbCitySortLabel.snp.right).offset(5)
            make.centerY.equalTo(lbCitySortLabel)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        ///AQI小娃娃指示图
        self.addSubview(childView)
        childView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.centerY.equalTo(lbAQI)
            make.right.equalTo(self).offset(-10)
        }
    }
    
    @objc func cityNameSelected(sender:UIButton){
        ///调用代理方法
        delegate?.CityNameSelected(sender: sender)
    }
}
