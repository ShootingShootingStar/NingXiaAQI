//
//  CityManageFlowLayout.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///城市管理界面的截图
class CityManageFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        
        let width = (ScreenWidth - 10 * 4) / 4
        itemSize = CGSize(width: width, height: width)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // 设置方向
        scrollDirection = .vertical
        // MARK: 设置collectionView
        // 设置分页
        collectionView?.isPagingEnabled = true
        // 设置隐藏横竖的滚动条
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        // 取消弹簧效果
        collectionView?.bounces = false
        
    }
}
