//
//  ShareViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/3.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit

///二维码分享
class ShareViewController: UIViewController {

    ///IOS的二维码
    private var iosImgView:UIImageView = UIImageView(image: UIImage(named:"testEWM"))
    ///IOS
    private lazy var lbIOS:UILabel = UILabel(title: "苹果（IOS）", fontSize: 20)
    ///分割线
    private var line:UIView = UIView()
    
    ///Android的二维码
    private var andImgView:UIImageView = UIImageView(image: UIImage(named:"testEWM"))
    ///Android
    private lazy var lbAndroid:UILabel = UILabel(title: "安卓（Android）", fontSize: 20)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup(){
        self.title = "二维码分享"
        self.view.backgroundColor = UIColor(r: 244, g: 244, b: 244)
        
        self.view.addSubview(iosImgView)
        iosImgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view).multipliedBy(0.6)
            make.centerX.equalTo(self.view)
            make.height.equalTo(iosImgView.snp.width)
            make.top.equalTo(self.view).offset(20)
        }
        self.view.addSubview(lbIOS)
        lbIOS.snp.makeConstraints { (make) in
            make.centerX.equalTo(iosImgView)
            make.top.equalTo(iosImgView.snp.bottom).offset(10)
        }
        self.view.addSubview(line)
        line.backgroundColor = UIColor.gray
        line.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(1)
        }
        self.view.addSubview(andImgView)
        andImgView.snp.makeConstraints { (make) in
            make.size.equalTo(iosImgView)
            make.centerX.equalTo(iosImgView)
            make.top.equalTo(line).offset(20)
        }
        self.view.addSubview(lbAndroid)
        lbAndroid.snp.makeConstraints { (make) in
            make.centerX.equalTo(iosImgView)
            make.top.equalTo(andImgView.snp.bottom).offset(10)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
