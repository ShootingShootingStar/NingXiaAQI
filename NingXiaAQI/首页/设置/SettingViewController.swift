//
//  SettingViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit
import PKHUD

class SettingViewController: UITableViewController {

    ///建设单位
    private lazy var lbCompanyName:UILabel = UILabel(title: "宁夏环境信息与应急中心", fontSize: 13)
    ///承建单位
    private lazy var lbChengJianName:UILabel = UILabel(title: "技术支持：西安绿创电子科技有限公司", fontSize: 13)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
    
        self.view.addSubview(lbCompanyName)
        lbCompanyName.textColor = UIColor.lightGray
        lbCompanyName.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).multipliedBy(1.8)
        }
        self.view.addSubview(lbChengJianName)
        lbChengJianName.textColor = UIColor.lightGray
        lbChengJianName.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(lbCompanyName.snp.bottom).offset(10)
        }
        
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        cell?.isSelected = false
        
        switch indexPath.row {
        case 0:
            let vc = AirLevelDescViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ShareViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            HUD.flash(.label("当前已经是最新版本。"),delay:1)
        default:
            break
        }
    }

    

}
