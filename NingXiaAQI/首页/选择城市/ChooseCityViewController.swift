//
//  ChooseCityViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///选择城市界面
class ChooseCityViewController: UITableViewController {

    var data:[String] = ["银川","石嘴山","固原","吴忠","中卫"]
    
    
    
    var headerViewList:[CityHeaderView] = {
        var list = [CityHeaderView]()
        list.append(CityHeaderView())
        list.append(CityHeaderView())
        list.append(CityHeaderView())
        list.append(CityHeaderView())
        list.append(CityHeaderView())
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setup()
    }
    
    func  setup(){
        
        self.title = "选择城市"
        
        self.tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        self.tableView.register(CityHeaderView.self, forHeaderFooterViewReuseIdentifier: "tableHeader")
        
        self.tableView.separatorStyle = .none
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { 
//        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "tableHeader") as! CityHeaderView
        let view = headerViewList[section]
        view.title = data[section]
        view.delegate = self
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let headView = headerViewList[section] 
        //如果分组是打开的就返回5否则返回0
        return headView.isOpenGroup == true ? 5 : 0
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    

}

extension ChooseCityViewController:CityHeaderViewDelegate{
    func SelectedHeaderView(headerView: CityHeaderView) { 
        self.tableView.reloadData()
    }
}
