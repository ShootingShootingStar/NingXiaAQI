//
//  AirLevelViewCell.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///空气质量级别说明
class AirLevelViewCell: UITableViewCell {
 
    ///当前多少行
    var indexRow:Int?{
        didSet{
            if let ir = indexRow{
                if ir > 2{
                    
                    lblevel.textColor = UIColor.white
                    
                    lbvalue.textColor = UIColor.white
                } 
            }
        }
    }
    ///数据
    var airLevelModel:AirLevelModel?{
    
        didSet{
            if let air = airLevelModel{
                
                self.baseView.backgroundColor = air.baseColor
                self.levelView.backgroundColor = air.levelColor
                self.lblevel.text = air.level
                self.lbvalue.text = air.value
                self.lbdesc.text = air.desc
                //边框颜色有bug,重绘的圆角那块会没边框。todo
//                self.baskView.layer.borderColor = air.levelColor.cgColor
//                self.baskView.layer.borderWidth = 1
            }
        }
       
    }
    ///底部的view
    private lazy var baseView:UIView = UIView()
    ///左边的圆形view
    private lazy var levelView:UIView = UIView()
    ///等级
    private lazy var lblevel:UILabel = UILabel(title: "优", fontSize: 13)
    ///value
    private lazy var lbvalue:UILabel = UILabel(title: "50-100", fontSize: 12)
    ///desc
    private lazy var lbdesc:UILabel = UILabel(title: "desc", fontSize: 12)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        self.addSubview(baseView)
        baseView.setCorners(radius: 35, con: [.bottomLeft,.topRight])
        baseView.snp.makeConstraints { (make) in
            make.left.top.equalTo(self).offset(10)
            make.height.equalTo(70)
            make.right.equalTo(self).offset(-10)
        }
        self.addSubview(levelView)
        levelView.setCorners(radius: 35, con: [.bottomLeft,.topRight,.bottomRight])
        levelView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(baseView)
            make.width.equalTo(levelView.snp.height)
        }
        
        levelView.addSubview(lblevel)
        lblevel.snp.makeConstraints { (make) in
            make.centerX.equalTo(levelView)
            make.centerY.equalTo(levelView).multipliedBy(0.8)
        }
        levelView.addSubview(lbvalue)
        lbvalue.snp.makeConstraints { (make) in
            make.centerX.equalTo(levelView)
            make.top.equalTo(lblevel.snp.bottom)
        }
        baseView.addSubview(lbdesc)
        lbdesc.numberOfLines = 0
        lbdesc.snp.makeConstraints { (make) in
            make.centerY.equalTo(baseView)
            make.left.equalTo(levelView.snp.right).offset(10)
            make.right.equalTo(baseView).offset(-10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
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
