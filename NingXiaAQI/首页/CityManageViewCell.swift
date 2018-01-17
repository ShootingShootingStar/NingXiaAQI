//
//  CityManageViewCell.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

protocol CityManageCellDelete {
    
    func LongPressCell()
    
    func Delete()
}
///管理城市的cell
class CityManageViewCell: UICollectionViewCell {
    
    var delegate:CityManageCellDelete?
    
    ///是否长按了，长按了就显示删除按钮
    var isLongPress:Bool?{
        didSet{
            if let p = isLongPress{
                if p{
                  self.btnDelete.isHidden = false
                }
            }
        }
    }
    ///容器视图
    public lazy var baseView:UIView = UIView()
    ///城市名字
    private lazy var lbtext:UILabel = UILabel(title: "银川", fontSize: 13)
    ///删除按钮
    private lazy var btnDelete:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"delete"), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        self.addSubview(baseView)
        baseView.backgroundColor = UIColor.white
        baseView.layer.cornerRadius = 5
        baseView.snp.makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(0.8)
            make.height.equalTo(self).multipliedBy(0.8)
            make.center.equalTo(self)
        }
        
        self.addSubview(lbtext)
        lbtext.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        self.addSubview(btnDelete)
        btnDelete.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.top.equalTo(baseView).offset(-10)
            make.left.equalTo(baseView).offset(-10)
        }
        btnDelete.isHidden = true
        
        ///加上长按手势
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(changan))
        baseView.isUserInteractionEnabled = true
        baseView.addGestureRecognizer(tap)
    }
    
    @objc func changan(){
        
       delegate?.LongPressCell()
        
    }
}

