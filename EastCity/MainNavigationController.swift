//
//  MainNavigationController.swift
//  EastCity
//
//  Created by kongshuaishuai on 16/3/10.
//  Copyright © 2016年 kongshuaishuai. All rights reserved.
//
import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = Config.NavigationBarColor
        
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.interactivePopGestureRecognizer!.delegate = nil;
        
        let leftButton=UIBarButtonItem();
        leftButton.title="左邊";
        leftButton.style=UIBarButtonItemStyle.Plain;
        leftButton.target=self;
//        leftButton.action=Selector("left");//必須實作 left()
        self.navigationItem.leftBarButtonItem=leftButton;
        
        
    }
    
    lazy var backBtn: UIButton = {
        //设置返
        let backBtn = UIButton(type: UIButtonType.Custom)
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
        backBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        backBtn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        backBtn.setImage(UIImage(named: "back_1"), forState: .Normal)
        backBtn.setImage(UIImage(named: "back_2"), forState: .Highlighted)
        backBtn.addTarget(self, action: #selector(MainNavigationController.backBtnClick), forControlEvents: .TouchUpInside)
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0)
        backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        let btnW: CGFloat = ScreenWidth > 375.0 ? 50 : 44
        backBtn.frame = CGRectMake(0, 0, btnW, 40)
        return backBtn
    }()
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
            let vc = self.childViewControllers[0]
            
            if self.childViewControllers.count == 1 {
                backBtn.setTitle(vc.tabBarItem.title!, forState: .Normal)
            } else {
                backBtn.setTitle("返回", forState: .Normal)
            }
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func backBtnClick() {
        self.popViewControllerAnimated(true)
    }
    
}
