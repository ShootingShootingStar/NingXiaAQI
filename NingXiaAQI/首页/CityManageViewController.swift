//
//  CityManageViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

///管理城市的界面 
class CityManageViewController: UICollectionViewController {

    
    var data:[String] = ["银川","石嘴山","固原","吴忠","中卫"]
    
    
    ///是否发生长按
    var isLongPress:Bool?{
        didSet{
            if let p = isLongPress{
                if p{
                    self.collectionView?.reloadData()
                }else{
                    self.collectionView?.reloadData()
                }
            }
        }
    }
    
    
    init(){
        super.init(collectionViewLayout: CityManageFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
 
    }
    
    func setup(){
        self.title = "更改城市"
        
        self.collectionView!.register(CityManageViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView!.register(CityManageAddViewCell.self, forCellWithReuseIdentifier: "addCell")
        
        self.collectionView?.backgroundColor = UIColor.Base
        
        isLongPress = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        ///将最后一个格子初始化成添加按钮
        if indexPath.row == data.count{

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath) as! CityManageAddViewCell

            return cell
        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CityManageViewCell
        cell.delegate = self
        cell.isLongPress = isLongPress
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == data.count{
            
            let vc = ChooseCityViewController()
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension CityManageViewController:CityManageCellDelete{
    func Delete() {
      
    }
    
    func LongPressCell() {
        
        if !isLongPress!{
            
            isLongPress = true
        }
    }
}
