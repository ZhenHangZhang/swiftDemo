//
//  ZHZNavViewController.swift
//  swiftDemo
//
//  Created by zhanghangzhen on 2016/11/21.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

import UIKit

class ZHZNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是根控制器 栈底控制器 才需要隐藏 根控制器不需要隐藏
        //注意super 之前和之后的问题的区别 childViewControllers.count > 1
        if childViewControllers.count > 1{
        
            viewController.hidesBottomBarWhenPushed = true;
            //一层显示首页标题 其他显示返回
            if let vc = (viewController as? ZHZBaseViewController){
                var title = "返回"
                if childViewControllers.count == 1{
                title = childViewControllers.first?.title ?? "返回"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent),isBack:true)
            }
        }
        super.pushViewController(viewController, animated:true)
    }
    @objc private func popToParent(){
    
        popViewController(animated: true)
    }
 
}
