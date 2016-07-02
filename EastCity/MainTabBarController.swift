//
//  MainTabBarController.swift
//  EastCity
//
//  Created by kongshuaishuai on 16/3/10.
//  Copyright © 2016年 kongshuaishuai. All rights reserved.
//
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpAllChildViewController()
        
        self.setValue(MainTabBar(), forKey: "tabBar")
        
//        addCenterButton(btnimage:UIImage(named:"tabbar-more")!, selectedbtnimg:UIImage(named:"tabbar-more")!, selector:"moreViewAppear", view:self.view)
        
    }
    
    /// 初始化所有子控制器
    private func setUpAllChildViewController() {
        // 综合
        tabBaraAddChildViewController(vc: NewsViewController(), title: "资讯", imageName: "tabbar-news", selectedImageName: "tabbar-news-selected")
        // 动弹
        tabBaraAddChildViewController(vc: YanViewController(), title: "烟草", imageName: "tabbar-tweet", selectedImageName: "tabbar-tweet-selected")
        
        tabBaraAddChildViewController(vc: ERViewController(), title: "二维码", imageName: "tabbar-more", selectedImageName: "tabbar-more")
        // 发现
        tabBaraAddChildViewController(vc: FenViewController(), title: "积分", imageName: "tabbar-discover", selectedImageName: "tabbar-discover-selected")
        // 我
        tabBaraAddChildViewController(vc: MyViewController(), title: "我", imageName: "tabbar-me", selectedImageName: "tabbar-me-selected")
        
    }
    
    private func tabBaraAddChildViewController(vc vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        
        let nav = MainNavigationController(rootViewController: vc)
        addChildViewController(nav)
    }
    
    
    
    func addCenterButton(btnimage buttonImage:UIImage,selectedbtnimg selectedimg:UIImage,selector:String,view:UIView)
    {
        
        let button:UIButton = UIButton(type: UIButtonType.Custom)
        button.frame = CGRectMake(0, 0,44,44);
        button.setImage(buttonImage, forState: UIControlState.Normal)
        button.setImage(selectedimg, forState: UIControlState.Selected)
        button.backgroundColor = Config.TabBarColor
        button.layer.cornerRadius = 22
        button.adjustsImageWhenDisabled = true;
        button.addTarget( self, action: Selector(selector), forControlEvents:UIControlEvents.TouchUpInside )
        let heightDifference:CGFloat = buttonImage.size.height - self.tabBar.frame.size.height
        if (heightDifference < 0){
            button.center = self.tabBar.center;
        }
        else
        {
            var center:CGPoint = self.tabBar.center;
            center.y = center.y - heightDifference/2.0;
            button.center = center;
        }
        view.addSubview(button);
    }
    
    func moreViewAppear(){
        
        
        
    }
    
    
    
}

class MainTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translucent = false
        self.backgroundImage = UIImage(named:"tabbar")
        self.tintColor = Config.TabBarColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}

