//
//  NewFeatureCell.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/25.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit
import SnapKit
///新特性页面的Cell
class NewFeatureCell: UICollectionViewCell {
    
    // MARK: - 懒加载
    private lazy var imageView : UIImageView = UIImageView()
    ///cell的背景图片
    var image : UIImage?{
        didSet{
            if let img = image{
                imageView.image = img
            }
        }
    }
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
}
