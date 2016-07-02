//
//  MyViewController.swift
//  EastCity
//
//  Created by kongshuaishuai on 16/3/14.
//  Copyright © 2016年 kongshuaishuai. All rights reserved.
//

import UIKit

class MyViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        self.view.backgroundColor = UIColor.yellowColor()
        let mytableview = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height), style: UITableViewStyle.Grouped)
        self.view.addSubview(mytableview)
        mytableview.delegate = self
        mytableview.dataSource = self
        mytableview.backgroundColor = UIColor.whiteColor()
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return 1
            
        }else if section==1 {
            return 4
            
        }else{
            return 1
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section==0{
            return 100
        }else if indexPath.section==1 {
            return 40
        }else{
            return 30
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if indexPath.section==0{
            cell.backgroundColor = UIColor.greenColor()
            let img = UIImage(named:"123.jpg")    //初始化图片
            let personImage = UIImageView(image: img)
            personImage.frame = CGRectMake(ScreenWidth/3, 0, ScreenWidth/3, 100)
            personImage.layer.cornerRadius = 50;
            personImage.layer.masksToBounds = true;
            cell.addSubview(personImage)   //显示在cell上
        }else if indexPath.section==1 {
            cell.imageView?.image = UIImage(named: "123.jpg")
            cell.textLabel?.text = "myFirstSwift"
        }else{
            cell.textLabel?.text = "退出"
        }
        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
