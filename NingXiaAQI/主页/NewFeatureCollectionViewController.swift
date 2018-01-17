//
//  NewFeatureCollectionViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/25.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
///新特性介绍界面
class NewFeatureCollectionViewController: UICollectionViewController {

    // MARK: - 懒加载
    /// 新特性的图片数组
    private let imageNames:[String] = ["NewOne","NewTwo", "NewThree","NewFour","NewFive"]
    /// pageControll
    private lazy var pageControll : UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.numberOfPages = self.imageNames.count
        pageControll.pageIndicatorTintColor = UIColor.white
        pageControll.currentPageIndicatorTintColor = UIColor.yellow
        return pageControll
    }()
    ///本来的UICollectionView初始化要传入一个布局类，现在自定义这个方法，默认使用我们自己的布局类。
    init(){
        super.init(collectionViewLayout: NewFeatureFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    func  setup(){
        self.collectionView!.register(NewFeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.addSubview(pageControll)
        //将pageControll指示器加上
        pageControll.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-10)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSize(width: 100, height: 20))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.imageNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewFeatureCell
     
        cell.image = UIImage(named:self.imageNames[indexPath.row])
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == self.imageNames.count - 1{
            ///是最后一个了。点击进入原有的主页
            KeyWindow.rootViewController = MainViewController()
        }
    }
    
    
    //MARK:scorellView的代理
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //算出当前是第几章，给pageController指示器赋值
        let currentPage = Int(scrollView.contentOffset.x/self.view.bounds.width + 0.5)
        
        pageControll.currentPage = currentPage
        
    }
    //在滑动的时候
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x / self.view.bounds.width > (CGFloat(imageNames.count) - 1.5){
            pageControll.isHidden = true
        }else{
            pageControll.isHidden = false
        }
    }

}
