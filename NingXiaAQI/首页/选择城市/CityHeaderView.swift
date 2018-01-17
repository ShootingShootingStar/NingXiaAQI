//
//  CityHeaderView.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

protocol CityHeaderViewDelegate {
    func SelectedHeaderView(headerView:CityHeaderView)
}


///分组 组头视图
class CityHeaderView: UITableViewHeaderFooterView {
 
    ///持有一个代理
    var delegate:CityHeaderViewDelegate?
    /// 是否打开分组
    var isOpenGroup:Bool? = false
    ///标题
    var title:String?{
        didSet{
            if let t = title{
                self.lbTitle.text = t
            }
        }
    }
    
    private lazy var arrowImg:UIImageView = UIImageView(image: UIImage(named:"city_arrow"))
    
    private lazy var lbTitle:UILabel = UILabel(title: "银川", fontSize: 14)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        self.addSubview(arrowImg)
        
        arrowImg.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
        }
        
        self.addSubview(lbTitle)
        
        lbTitle.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(arrowImg.snp.right).offset(10)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.selectedHeader(headerView:)))
        self.isUserInteractionEnabled = true
        
        self.addGestureRecognizer(tap)
    }

    @objc func selectedHeader(headerView:CityHeaderView){
         
        self.isOpenGroup = !self.isOpenGroup!
        ///动画那个小箭头，使其恢复过来
        if self.isOpenGroup!{
            UIView.animate(withDuration: 0.3, animations: {
                self.arrowImg.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
            })
        }else{
             self.arrowImg.transform = CGAffineTransform(rotationAngle: 0)
            
        }
        
        delegate?.SelectedHeaderView(headerView: headerView)
    }
}
