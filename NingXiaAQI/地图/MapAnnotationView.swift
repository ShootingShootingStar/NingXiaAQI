//
//  MapAnnotationView.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/6.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import Foundation
///自定义的标注视图
class MapAnnotationView: BMKAnnotationView {
    ///数据
  public  var dic:(key: Any, value: Any)?{
        didSet{
            if let  d = dic{
                let list = d.value as! NSDictionary
                let aqi = list["AQI"] as! Int
                self.image = UIImage(aqi: aqi)
                self.lbaql.text = "\(aqi)"
                let pop =  MapPaoPao()
                pop.dic = self.dic
                self.paopaoView = BMKActionPaopaoView(customView:pop)
            }
        }
    }
    
    private lazy var lbaql:UILabel = UILabel()
    
    override init!(annotation: BMKAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        lbaql.textAlignment = .center
        lbaql.textColor = UIColor.white
        lbaql.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(lbaql)
        lbaql.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).multipliedBy(0.7)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


class MapPaoPao: UIView {
    ///蒙版颜色
    var maskColor:UIColor = UIColor.white
    ///数据
    public  var dic:(key: Any, value: Any)?{
        didSet{
            if let  d = dic{
                let list = d.value as! NSDictionary
                let aqi = list["AQI"] as! Int
                self.lbtitle.text = d.key as? String
                self.maskColor =  UIColor(aqiMask: aqi)
                self.lbaqi.text = "AQI：\(aqi)"
                self.lbpp.text = "首要污染物：\(aqi)"
                self.lbpm25.text = "PM2.5：\(list["PM2.5"]!)"
                self.lbpm10.text = "PM10：\(list["PM10"]!)"
                self.lbno2.text = "No2：\(list["No2"]!)"
                self.lbso2.text = "So2：\(list["So2"]!)"
                self.lbo3.text = "O3：\(list["O3"]!)"
                self.lblevel.text = "级别：\(list["级别"]!)"
            }
        }
    }
    ///颜色绘制
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let path = UIBezierPath(rect: bounds.insetBy(dx: 5, dy: 5))
        ///此处可以用蒙版
        UIColor.white.setFill()
        let conext = UIGraphicsGetCurrentContext()
        conext?.setShadow(offset: CGSize(width: 5, height: 5), blur: 10, color: UIColor.lightGray.cgColor) //阴影绘制，直接附加到path上了
        path.fill()
    }
    ///底层view
    private lazy var baseView:UIView = UIView()
    ///标题
    private lazy var lbtitle:UILabel = UILabel(title: "监测站1", fontSize: 13)
    ///AQI
    private lazy var lbaqi:UILabel = UILabel(title: "首要50", fontSize: 13)
    ///首要污染物
    private lazy var lbpp:UILabel = UILabel(title: "首要污染物", fontSize: 13)
    ///PM2.5
    private lazy var lbpm25:UILabel = UILabel(title: "pm25", fontSize: 13)
    ///PM10
    private lazy var lbpm10:UILabel = UILabel(title: "pm10", fontSize: 13)
    ///no2
    private lazy var lbno2:UILabel = UILabel(title: "no2", fontSize: 13)
    ///so2
    private lazy var lbso2:UILabel = UILabel(title: "so2", fontSize: 13)
    ///o3
    private lazy var lbo3:UILabel = UILabel(title: "o3", fontSize: 13)
    ///级别
    private lazy var lblevel:UILabel = UILabel(title: "o3", fontSize: 13)
    ///时间
    private lazy var lbtime:UILabel = UILabel(title: "o3", fontSize: 13)
    ///小JJ
    private lazy var imgMapJJ:UIImageView = UIImageView(image: UIImage(named:"mapJJ"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame.size = CGSize(width: 200, height: 240)
        self.backgroundColor = UIColor.clear
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        self.addSubview(baseView)
        baseView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(5)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-5)
            make.height.equalTo(30)
        }
        baseView.backgroundColor = UIColor(r: 74, g: 144, b: 226, a: 1)
        lbtitle.textColor = UIColor.white
        baseView.addSubview(lbtitle)
        lbtitle.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.centerY.equalTo(baseView)
        }
        
        self.addSubview(lbaqi)
        lbaqi.snp.makeConstraints { (make) in
            make.left.equalTo(lbtitle)
            make.top.equalTo(baseView.snp.bottom).offset(5)
        }
        self.addSubview(lbpp)
        lbpp.snp.makeConstraints { (make) in
            make.left.equalTo(lbaqi)
            make.top.equalTo(lbaqi.snp.bottom).offset(5)
        }
        self.addSubview(lbpm25)
        lbpm25.snp.makeConstraints { (make) in
            make.left.equalTo(lbpp)
            make.top.equalTo(lbpp.snp.bottom).offset(5)
        }
        self.addSubview(lbpm10)
        lbpm10.snp.makeConstraints { (make) in
            make.left.equalTo(lbpm25)
            make.top.equalTo(lbpm25.snp.bottom).offset(5)
        }
        self.addSubview(lbno2)
        lbno2.snp.makeConstraints { (make) in
            make.left.equalTo(lbpm10)
            make.top.equalTo(lbpm10.snp.bottom).offset(5)
        }
        self.addSubview(lbso2)
        lbso2.snp.makeConstraints { (make) in
            make.left.equalTo(lbno2)
            make.top.equalTo(lbno2.snp.bottom).offset(5)
        }
        self.addSubview(lbo3)
        lbo3.snp.makeConstraints { (make) in
            make.left.equalTo(lbso2)
            make.top.equalTo(lbso2.snp.bottom).offset(5)
        }
        self.addSubview(lblevel)
        lblevel.snp.makeConstraints { (make) in
            make.left.equalTo(lbo3)
            make.top.equalTo(lbo3.snp.bottom).offset(5)
        }
        self.addSubview(lbtime)
        lbtime.snp.makeConstraints { (make) in
            make.left.equalTo(lblevel)
            make.top.equalTo(lblevel.snp.bottom).offset(5)
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = " YYYY-MM-dd HH:mm:ss"
        let dateString = dateformatter.string(from: Date())
        lbtime.text = "时间：\(dateString)"
        self.addSubview(imgMapJJ)
        imgMapJJ.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: 20, height: 15))
            make.top.equalTo(self.snp.bottom).offset(-10)
        }
    }
    
    
}
