//
//  HomeViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2017/12/28.
//  Copyright © 2017年 lc－mac. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
///首页
class HomeViewController: UICollectionViewController {

    ///图片组
    let imageNames:[String] = ["YinChuan","WuZhong","ShiZuiShan","GuYuan","ZhongWei"]
    
    
    init(){
        super.init(collectionViewLayout: HomeCollectionLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setup()
    }
    
    func  setup(){
        self.collectionView!.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: UIImage(named:"add"), style: .done, target: self, action: #selector(leftbtn))
        
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(image: UIImage(named:"setting"), style: .done, target: self, action: #selector(rightbtn))
        
    }
    ///左侧按钮事件-添加城市
    @objc func leftbtn(){
        
        let vc = CityManageViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    ///右侧按钮事件-设置
    @objc func rightbtn(){
        
        let sb = UIStoryboard.init(name: "Setting", bundle: nil)
        
        let vc = sb.instantiateInitialViewController()
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
    
        cell.bgimage = UIImage(named:self.imageNames[indexPath.row])
        // Configure the cell
    
        cell.fatherViewController = self
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
