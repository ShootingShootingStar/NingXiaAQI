//
//  HomeCollectionLayout.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/28.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit
///首页的Cell的布局
class HomeCollectionLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        
       itemSize = CGSize(width: ScreenWidth, height: ScreenHeight-TabHeight-NavigationHeight)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        // 设置方向
        scrollDirection = .horizontal
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
