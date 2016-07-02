//
//  RegisterViewController.swift
//  EastCity
//
//  Created by kongshuaishuai on 16/3/15.
//  Copyright © 2016年 kongshuaishuai. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    var PhnneNum = UITextField()
    var TestNum  = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.greenColor()
        //创建登录按钮
        let LoginBtn = UIButton(frame:CGRectMake(0,300,ScreenWidth, 40))
        LoginBtn.backgroundColor = UIColor.redColor()
        LoginBtn.setTitle("获取", forState:UIControlState.Normal)
        LoginBtn.addTarget(self,action:#selector(RegisterViewController.tapp),forControlEvents:.TouchUpInside)
        self.view.addSubview(LoginBtn);
        //创建注册按钮
        let RegisterBtn = UIButton(frame:CGRectMake(0,400,ScreenWidth, 40))
        RegisterBtn.backgroundColor = UIColor.redColor()
        RegisterBtn.setTitle("确定", forState:UIControlState.Normal)
        RegisterBtn.addTarget(self,action:#selector(RegisterViewController.tapp1),forControlEvents:.TouchUpInside)
        self.view.addSubview(RegisterBtn);
        //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝文本框＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
        //手机号
        PhnneNum = UITextField(frame: CGRectMake(40,100,200,30))
        PhnneNum.placeholder = " 请输入手机号"
        PhnneNum.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(PhnneNum)
        //验证码
        TestNum = UITextField(frame: CGRectMake(40,150,200,30))
        TestNum.placeholder = "请输入验证码"
        TestNum.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(TestNum)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tapp(){
    print("获取验证码")
        SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethod.init(0), phoneNumber: PhnneNum.text, zone: "86", customIdentifier: "") { (error) -> Void in
            if(error == nil) {
                print("获取成功")
            }else{
                print("获取失败")
            }
        }
    }
    func tapp1(){
        
        SMSSDK.commitVerificationCode(TestNum.text, phoneNumber: PhnneNum.text, zone: "86") {
            (error) -> Void in
            if(error == nil) {
                print("验证成功")
            }else{
                print("错误信息：%@",error)
            }
        }
        print("返回上一页,输入的验证码错误，可以alert提醒一下，没有写")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
