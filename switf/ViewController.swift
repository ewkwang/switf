//
//  ViewController.swift
//  switf
//
//  Created by 睿隆 on 2017/8/17.
//  Copyright © 2017年 睿隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var x = CGFloat()
    
//    let scrollView = UIScrollView() // 定义属性
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.yellow // 设置视图背景颜色
          view.backgroundColor = UIColor.yellow 
        
       self.congitionUINav() // 调用配置导航栏
       self.congitionLunBo()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerBtn(sender:)), userInfo: nil, repeats: true)
        
 }

    // 定时器
    func timerBtn(sender:AnyObject) {
        // 判断如果当前页数是最后一页
        
        if self.pageControl.currentPage == self.pageControl.numberOfPages-1 {
            
            
                self.pageControl.currentPage = 0 // 就从头开始
            
            
        }else{
            self.pageControl.currentPage += 1 // 否则依次往后滚动视图
        }
       
        
        
            let page = CGFloat(self.pageControl.currentPage)
            self.x  = CGFloat(page * self.scrollerView.frame.width)
            self.scrollerView.contentOffset = CGPoint.init(x: self.x, y: 0)

        
    }
    
    
    // 配置轮播图
   private func congitionLunBo() {
    let headView = UIView.init(frame: CGRect.init(x: x, y: y, width: w, height: 300))
//    headView.backgroundColor = UIColor.lightGray
    
    view.addSubview(headView)
    
    headView.addSubview(self.scrollerView)
    headView.addSubview(self.pageControl)
   

    for i in 0..<3 {
        let image = UIImage.init(contentsOfFile:Bundle.main.path(forResource: "\(i+1)", ofType: "jpg")! )!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let start: CGFloat = CGFloat(i)
        let imageView: UIImageView = UIImageView.init(frame: CGRect.init(x: start * scrollerView.frame.size.width, y: 0, width: scrollerView.frame.size.width, height: scrollerView.frame.size.height))
        
        imageView.image = image
        
        scrollerView.addSubview(imageView)
    }
   
    }
    
    
    // 懒加载
    lazy var scrollerView: UIScrollView = {
        // 初始化frame
        let scrollerView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: w, height: 300))
        
        let heiht = scrollerView.frame.size.height
        let width = self.view.frame.size.width
        scrollerView.contentSize = CGSize.init(width: 3*width, height: 300)
        scrollerView.isPagingEnabled = true // 允许分页
        scrollerView.showsVerticalScrollIndicator = false
        scrollerView.showsHorizontalScrollIndicator = false
        scrollerView.delegate = self // 设置代理
     
        return scrollerView
    }()
 
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl.init(frame: CGRect.init(x: 150, y: 270, width: 100, height: 20))
        
        // 设置分页的页码数和当前页面
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        
        //设置选中页码点的颜色和未选中页码点的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        pageControl.pageIndicatorTintColor = UIColor.red
        
        return pageControl
    }()
    
 
    // 配置导航栏  声明新的方法时 用 func 相当于OC中的 （-）对象方法
   private  func  congitionUINav() {
        title = "这是标题"; // 设置导航栏标题
        
        // 设置左边item
        let leftItem1 = UIBarButtonItem.init(title: "左边", style: UIBarButtonItemStyle.done, target: self, action:#selector(leftItem3(btn:)))
        leftItem1.tintColor = UIColor.blue
        
        let leftItem2 = UIBarButtonItem.init(title:"第二个", style: UIBarButtonItemStyle.done, target: self, action:#selector(leftItem(btn:)))
        leftItem2.tintColor = UIColor.blue
        
        let rightButton = UIButton.init(type: UIButtonType.system)
        rightButton.frame = CGRect.init(x: 0, y: 0, width: 60, height: 32)
        rightButton.setTitle("爱我", for: UIControlState.normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.size.width/30)
        rightButton.tintColor = UIColor.blue
    rightButton.addTarget(self, action:#selector(string(sender:)), for: UIControlEvents.touchUpInside)
        
        let rightItem = UIBarButtonItem.init(customView: rightButton)
        navigationItem.rightBarButtonItem = rightItem
        
        
        navigationItem.leftBarButtonItems = [leftItem1,leftItem2]
        navigationController?.navigationBar.barStyle = UIBarStyle.black // 设置导航栏背景风格
        navigationController?.navigationBar.isTranslucent = false // 设置导航栏的半透明效果，默认是yes

    }
    
    
    func leftItem3(btn:UIBarButtonItem){
        print("点击")
    }
    func leftItem(btn:UIBarButtonItem){
        print("我是小明")
    }
    func string(sender:UIButton){
        print("啦啦啦")
    }
    
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //每一个滚动视图的宽度
         let wid = self.scrollerView.frame.size.width
        
        //当前页码
        let pageNumber = CGFloat(self.scrollerView.contentOffset.x/wid)
        self.pageControl.currentPage = Int(pageNumber)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

