//
//  MapViewController.swift
//  NingXiaAQI
//
//  Created by lc－mac on 2018/1/4.
//  Copyright © 2018年 lc－mac. All rights reserved.
//

import UIKit
import PKHUD

///地图界面
class MapViewController: UIViewController {

    var _mapView: BMKMapView?
    
    var _locService: BMKLocationService?
    
    ///地图放大
    var mapSacleBig:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"mapbig"), for: .normal)
        btn.addTarget(self, action: #selector(mapScale(sender:)), for: .touchUpInside)
        btn.tag = 100001
        return btn
    }()
    ///地图缩小
    var mapSacleSmall:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"mapsmall"), for: .normal)
        btn.addTarget(self, action: #selector(mapScale(sender:)), for: .touchUpInside)
        btn.tag = 100000
        return btn
    }()
    ///地图图层
    var mapLayer:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"mapLayer"), for: .normal)
        btn.addTarget(self, action: #selector(maplayerChange(sender:)), for: .touchUpInside)
        return btn
    }()
    ///地图回到中心
    var mapCenter:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"mapcenter"), for: .normal)
        btn.addTarget(self, action: #selector(mapMoveToCenter(sender:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        addPointMarker()
    }
    
    func setup(){
        _mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        _mapView?.delegate = self
        _mapView?.showsUserLocation = true
        _mapView?.userTrackingMode = BMKUserTrackingModeNone
        _locService = BMKLocationService()
        _locService?.delegate = self
        _locService?.startUserLocationService()
        ///地图上的4个工具
        _mapView?.addSubview(mapSacleSmall)
        mapSacleSmall.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.bottom.equalTo(_mapView!).offset(-150)
            make.right.equalTo(_mapView!).offset(-20)
        }
        _mapView?.addSubview(mapSacleBig)
        mapSacleBig.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.bottom.equalTo(mapSacleSmall.snp.top).offset(-10)
            make.right.equalTo(mapSacleSmall)
        }
        _mapView?.addSubview(mapLayer)
        mapLayer.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.bottom.equalTo(mapSacleBig.snp.top).offset(-10)
            make.right.equalTo(mapSacleBig)
        }
        _mapView?.addSubview(mapCenter)
        mapCenter.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.bottom.equalTo(mapLayer.snp.top).offset(-10)
            make.right.equalTo(mapLayer)
        }
        self.view.addSubview(_mapView!)
    }
    func addPointMarker(){
        
         let path = Bundle.main.path(forResource: "AirStationData", ofType: "plist")
        if let dic = NSDictionary(contentsOfFile: path!){
            for ele in dic{
                let ani = MapAnnotation()
                ani.dic = ele
                ani.title = ele.key as! String
                _mapView?.addAnnotation(ani)
            }
        }
    }
    ///地图放大以及缩小事件
    @objc func mapScale(sender:UIButton){
        
        if sender.tag == 100001{
            //放大
            _mapView?.zoomLevel = (_mapView?.zoomLevel)! + 1
        }else if sender.tag == 100000{
            _mapView?.zoomLevel = (_mapView?.zoomLevel)! - 1
        }else{
             HUD.flash(.label("未知错误！"),delay:1)
        }
    }
    ///地图图层切换
    @objc func maplayerChange(sender:UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            //正常地图
            _mapView?.mapType = UInt(BMKMapTypeSatellite)
        }else{
            //卫星地图
            _mapView?.mapType = UInt(BMKMapTypeStandard)
        }
    }
    ///滚动到中心点
    @objc func mapMoveToCenter(sender:UIButton){
        _locService?.startUserLocationService()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _mapView?.viewWillAppear()
        _mapView?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        BMKMapView.enableCustomMapStyle(false)//消失时，关闭个性化地图
        _mapView?.viewWillDisappear()
        _mapView?.delegate = nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension MapViewController:BMKMapViewDelegate{
    func mapViewDidFinishLoading(_ mapView: BMKMapView!) {
        
    }
}


extension MapViewController:BMKLocationServiceDelegate{
   
    //用户位置更新后，会调用此函数
    func didUpdate(_ userLocation: BMKUserLocation!) {
        _mapView?.centerCoordinate = userLocation.location.coordinate
        _mapView?.updateLocationData(userLocation)
        //更新一下地图到用户当前位置，然后就关闭定位
        _locService?.stopUserLocationService()
    }
    //定位失败后
    func didFailToLocateUserWithError(_ error: Error!) {
        HUD.flash(.label("定位发生错误!"),delay:1)
    }
    //定位停止后
    func didStopLocatingUser() {
        
        //HUD.flash(.label("定位停止!"),delay:1)
    }
    
    func mapView(_ mapView: BMKMapView!, viewFor annotation: BMKAnnotation!) -> BMKAnnotationView! {
        
        if let ani = annotation as? MapAnnotation{
            let reuseIndetifier = "reuseIndetifier"
            var aniview = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIndetifier)
            if aniview == nil{
                let mani = MapAnnotationView(annotation: ani, reuseIdentifier: reuseIndetifier)
                mani?.dic = ani.dic
                aniview = mani
                
            } 
            return aniview
            
        }
        
        return nil
    }
}
