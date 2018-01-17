//
//  NewFeatureFlowLayout.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/25.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit
///新特性页面的自定义布局
class NewFeatureFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        // MARK: 设置Layout
        // 设置itemSize
        itemSize = UIScreen.main.bounds.size
        // 设置间距
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
