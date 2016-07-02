//
//  LoginViewController.swift
//  EastCity
//
//  Created by kongshuaishuai on 16/3/14.
//  Copyright © 2016年 kongshuaishuai. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝按钮＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
        //创建登录按钮
        let LoginBtn = UIButton(frame:CGRectMake(0,300,ScreenWidth, 40))
        LoginBtn.backgroundColor = UIColor.redColor()
        LoginBtn.setTitle("登    录", forState:UIControlState.Normal)
        LoginBtn.addTarget(self,action:#selector(LoginViewController.tapped),forControlEvents:.TouchUpInside)
        self.view.addSubview(LoginBtn);
        //创建注册按钮
        let RegisterBtn = UIButton(frame:CGRectMake(0,400,ScreenWidth, 40))
        RegisterBtn.backgroundColor = UIColor.redColor()
        RegisterBtn.setTitle("注    册", forState:UIControlState.Normal)
        RegisterBtn.addTarget(self,action:#selector(LoginViewController.tapped1),forControlEvents:.TouchUpInside)
        self.view.addSubview(RegisterBtn);
        //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝文本框＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
        //用户名
        let NameText = UITextField(frame: CGRectMake(40,100,200,30))
        NameText.placeholder = "请输入用户名"
        NameText.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(NameText)
        //密码
        let KeyText = UITextField(frame: CGRectMake(40,150,200,30))
        KeyText.placeholder = "请输入密码"
        KeyText.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(KeyText)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tapped(){
        print("点击了登录")
        //跳转到主界面
        let mianview = MainTabBarController()
        self.presentViewController(mianview, animated: true, completion: nil)
    }
    func tapped1(){
        print("点击了注册")
        //跳转到主界面
                let mianview = RegisterViewController()
                self.presentViewController(mianview, animated: true, completion: nil)
    }
}
