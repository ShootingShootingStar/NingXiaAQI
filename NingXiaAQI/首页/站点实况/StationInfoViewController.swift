//
//  StationInfoViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/7.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///站点实况
class StationInfoViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        setup()
    }
    
    func setup(){
        
        self.tableView.register(StationInfoViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! StationInfoViewCell

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lab = UILabel(title: "共5个站点，监测事件：2018-1-8 13时", fontSize: 12)
        lab.textAlignment = .center
        lab.backgroundColor = UIColor.Base_mask
        lab.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 30)
        return lab
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
