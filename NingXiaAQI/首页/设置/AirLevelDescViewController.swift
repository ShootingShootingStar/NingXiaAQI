//
//  AirLevelDescViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///空气污染级别说明
class AirLevelDescViewController: UITableViewController {

    private var data:[AirLevelModel] = {
        var list = [AirLevelModel]()
        list.append(AirLevelModel(level: "优", value: "0-50", desc: "空气质量令人满意，基本无空气污染，各类人群可正常活动。", levelColor: UIColor.You,baseColor: UIColor.You_mask))
        list.append(AirLevelModel(level: "良", value: "51－100", desc: "空气质量可接受，但某些污染物可能对极少数异常敏感人群健康有较弱影响，建议极少数异常敏感人群应减少户外活动。", levelColor: UIColor.Liang,baseColor: UIColor.Liang_mask))
        list.append(AirLevelModel(level: "轻度污染", value: "101－150", desc: "易感人群症状有轻度加剧，健康人群出现刺激症状。建议儿童、老年人及心脏病、呼吸系统疾病患者应减少长时间、高强度的户外锻炼。", levelColor: UIColor.QingDuWuRan,baseColor: UIColor.QingDuWuRan_mask))
        list.append(AirLevelModel(level: "中度污染", value: "151－200", desc: "进一步加剧易感人群症状，可能对健康人群心脏、呼吸系统有影响，建议疾病患者避免长时间、高强度的户外锻练，一般人群适量减少户外运动。", levelColor: UIColor.ZhongDuWuRan,baseColor: UIColor.ZhongDuWuRan_mask))
        list.append(AirLevelModel(level: "重度污染", value: "201－300", desc: "心脏病和肺病患者症状显著加剧，运动耐受力降低，健康人群普遍出现症状，建议儿童、老年人和心脏病、肺病患者应停留在室内，停止户外运动，一般人群减少户外运动。", levelColor: UIColor.ZhongDuWuRan_,baseColor: UIColor.ZhongDuWuRan__mask))
          list.append(AirLevelModel(level: "严重污染", value: ">300", desc: "健康人群运动耐受力降低，有明显强烈症状，提前出现某些疾病，建议儿童、老年人和病人应当留在室内，避免体力消耗，一般人群应避免户外活动。", levelColor: UIColor.YanZhongWuRan,baseColor: UIColor.YanZhongWuRan_mask))
        
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup(){
        
        self.title = "空气污染级别说明"
        
        self.tableView.register(AirLevelViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        self.tableView.separatorStyle = .none
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! AirLevelViewCell

        // Configure the cell...
        cell.airLevelModel = data[indexPath.row]
        cell.indexRow = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
