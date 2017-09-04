//
//  TwoViewController.swift
//  switf
//
//  Created by 睿隆 on 2017/8/17.
//  Copyright © 2017年 睿隆. All rights reserved.
//

import UIKit
import Alamofire

class TwoViewController: UIViewController {
let BaiduURL = "http://0.0.0.0:tuicool@api.tuicool.com/api/articles/hot.json?cid=0&size=30"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
//        self.congitionUINav()
//        self.congitionLunBo()
//        self.createNetWork()
//        self.createNetWorkGet()
        self.createData()
        
        let button = UIButton.init(type: UIButtonType.system)
        button.frame = CGRect.init(x: 100, y: 200, width: 100, height: 40)
        button.setTitle("下一页", for: UIControlState.normal)
        button.addTarget(self, action: #selector(buttonNext), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    
    // MARK: - switf 调用 OC

    func buttonNext(sender:UIButton) {
        let vc = OCviewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Alamofire做网络请求
    func createData(){
        // 通用get post
        Alamofire.request("http://0.0.0.0:tuicool@api.tuicool.com/api/articles/hot.json?cid=0&size=30", method: .get, parameters:nil , encoding:  URLEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
  
                return .success
            }
            .responseJSON { response in
                print(response)
        }
      
        
   }
    
    
    
    
    
/*
    // MARK: - 利用NSURLSession做(GET)网络请求

    func createNetWorkGet() {
        
        //1. 创建请求路径
        let path = "http://0.0.0.0:tuicool@api.tuicool.com/api/articles/hot.json"
        //拼接参数(GET请求参数需要以"?"连接拼接到请求地址的后面，多个参数用"&"隔开，参数形式：参数名=参数值)
        //size:请求数据的长度
        let path2 = path + "?cid=0&size=30"
        // 转换为url
        let url = NSURL.init(string: path2)
        
        //2. 创建请求对象
         //NSURLRequest类型的请求对象的请求方式一定是GET(默认GET且不能被改变)  NSMutableURLRequest类型的请求对象的请求方式一定是POST
        let request = NSURLRequest.init(url: url! as URL)
        
        //3. 根据会话模式创建session(创建默认会话模式)
        // 快速创建默认会话模式的session
         let session = URLSession.shared
        
        //4. 创建任务
        //参数1：需要发送的请求对象
        //参数2：服务返回数据的时候需要执行的对应的闭包
        //闭包参数1：服务器返回给客户端的数据
        //闭包参数2：服务器响应信息
        //闭包参数3：错误信息
       let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
        
        
        if data != nil{
            let dict = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(dict)
        }
        else{
            print("请求数据失败")
        }
        
        
        }
       
        //5.开始执行任务
        task.resume()
        
    }
    
*/
    
    
    // MARK: - 利用NSURLSession做(POST)网络请求

    func createNetWork() {
        
        //1.创建请求地址
        let url = NSURL.init(string: "http://ht.pcdd.me/api/room")
        //2.创建求情对象
        //POST请求的请求对象必须使用NSMutableURLRequest创建，因为使用NSURLRequest不能更改请求方式，但是NSMutableURLRequest可以
        let request = NSMutableURLRequest.init(url: url! as URL)
        
        // 设置请求方式(默认GET)
        request.httpMethod = "POST" //设置请求方式为POST请求

        //设置请求体(POST请求的参数是放到请求体中的)
        //a.拼接字符串
        //参数1=参数值1&参数2=参数2...
        let sendStr = "account=15003770626&imei=9155449F-62BC-4CBA-935E-B6A56572219A"
        
        //b.将字符串转换成二进制
        //参数：编码方式
        let sendData = sendStr.data(using: String.Encoding.utf8)
        request.httpBody = sendData
        
        //3. 创建session
        //快速创建一个默认会话模式的session
        let session = URLSession.shared
        
        //4. 创建任务
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
          
        
            if data != nil{
                let ret = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(ret)
            }
            else{
                print("请求失败")
            }
            
          
            
        }
       
         task.resume()
        
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
