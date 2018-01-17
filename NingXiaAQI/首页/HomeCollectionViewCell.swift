//
//  HomeCollectionViewCell.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/28.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit
import MarqueeLabel

///首页的格子
class HomeCollectionViewCell: UICollectionViewCell {
    ///持有一个父容器
    var fatherViewController:UIViewController?
    
    ///背景图片
    var bgimage:UIImage?{
        didSet{
            if let img = bgimage{
                self.bgImageView.image = img
            }
        }
    }
    
    ///背景图片控件
    private lazy var bgImageView:UIImageView = {
        let view = UIImageView(image: UIImage(named:"NewFour"))
        
        return view
    }()
    ///aqi 区块
    private lazy var cityAQIView:CityAQIView = CityAQIView()
    ///污染物区块
    private lazy var pollutantView:PollutantView = PollutantView()
    ///给个半透明发光的遮罩在tip的后面能稍微好看点
    private lazy var maskTipView:UIView = UIView()
    ///温馨提示文字
    private lazy var lbTip:MarqueeLabel = MarqueeLabel(frame: CGRect.zero, duration: 20, fadeLength: 10)
    
    
    ///滚动的温馨提示 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup() 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        
        self.addSubview(bgImageView)
        
        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        self.addSubview(cityAQIView)
        cityAQIView.delegate = self
        cityAQIView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(300)
        }
        self.addSubview(pollutantView)
        pollutantView.snp.makeConstraints { (make) in
            make.top.equalTo(cityAQIView.snp.bottom).offset(10)
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(100)
        }
        self.addSubview(maskTipView)
        maskTipView.backgroundColor = UIColor(r: 20, g: 70, b: 235, a: 0.3)
        maskTipView.snp.makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.98)
            make.centerX.equalTo(self)
            make.height.equalTo(50)
            make.bottom.equalTo(self).offset(-20)
        }
        maskTipView.addSubview(lbTip)
        lbTip.text = "可以正常在户外活动，易敏感人群应减少外出。可以正常在户外活动，易敏感人群应减少外出。"
        lbTip.font = UIFont.systemFont(ofSize: 15)
        lbTip.textColor = UIColor.white 
        lbTip.type = .continuous
        ///这是设置缓冲的距离
        lbTip.leadingBuffer = ScreenWidth * 0.98 * 0.98
        lbTip.snp.makeConstraints { (make) in
            make.width.equalTo(maskTipView).multipliedBy(0.98)
            make.center.equalTo(maskTipView)
        }
    }
}

extension HomeCollectionViewCell:CityAQIViewDelegate{
    
    func CityNameSelected(sender: UIButton) {
        let vc = StationInfoViewController()
        vc.title = sender.titleLabel?.text?.replacingOccurrences(of: ">", with: "")
        self.fatherViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
