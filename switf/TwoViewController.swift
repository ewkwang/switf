//
//  TwoViewController.swift
//  switf
//
//  Created by 睿隆 on 2017/8/17.
//  Copyright © 2017年 睿隆. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        
        self.congitionUINav()
        self.congitionLunBo()

        
    }
    
      // MARK: - 头部视图
    func congitionLunBo() {
        let headView = UIView.init(frame: CGRect.init(x: x, y: y, width: w, height: w/4*1.5))
        headView.backgroundColor = UIColor.lightGray
        self.view.addSubview(headView)
    }
    
    
    
   // MARK: - 导航栏
    func congitionUINav(){
        
        self.title = "游戏大厅"
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.isTranslucent = false
        
        
        let leftBtn =  UIButton.init(type: UIButtonType.custom)
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: 60, height: 32)
        leftBtn.setImage(UIImage.init(named: "1.jpg"), for: UIControlState.normal)
//        leftBtn.tintColor = UIColor.white
        leftBtn.addTarget(self, action: #selector(leftButton), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
    
        
        let rightItem1 = UIBarButtonItem.init(image: UIImage.init(named: "2.jpg"), style: UIBarButtonItemStyle.done, target: self, action: #selector(right1))
        let rightItem2 = UIBarButtonItem.init(image: UIImage.init(named: "3.jpg"), style: UIBarButtonItemStyle.done, target: self, action: #selector(right2))
        
        navigationController?.navigationItem.rightBarButtonItems = [rightItem1,rightItem2]
    }
    
    
    // MARK: - 按钮的实现方法
    func leftButton(){
        print("左边")
    }
    
    func right1(){
        print("右边1")
    }
    func right2() {
        print("右边2")
    }
    
    
    
    
    
    
    
    
    


}
