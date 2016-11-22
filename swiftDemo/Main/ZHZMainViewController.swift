//
//  ZHZMainViewController.swift
//  swiftDemo
//
//  Created by zhanghangzhen on 2016/11/21.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

import UIKit
import SVProgressHUD

class ZHZMainViewController: UITabBarController {

    fileprivate lazy var composeBtn : UIButton = UIButton.yw_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
    fileprivate var timer : Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addchildvcs()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func addchildvcs(){
    
        let array: [[String:Any]] = [
            ["clsName":"HomeViewController","title":"首页","imageName":"home","visitorInfo" : ["imageName": "","message":"关注一些人，回这里看看有什么惊喜"]],
            ["clsName":"MessageViewController","title":"消息","imageName":"message_center","visitorInfo" : ["imageName": "visitordiscover_image_message","message":"登陆后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
            ["clsName":"UIViewcontroller"],
            ["clsName":"DiscoverViewController","title":"发现","imageName":"discover","visitorInfo" : ["imageName": "visitordiscover_image_message","message":"登陆后，最新、最热的微博尽在掌握中，不会再于实事潮流擦肩而过"]],
            ["clsName":"ProfileViewController","title":"我的","imageName":"profile","visitorInfo" : ["imageName": "visitordiscover_image_profile","message":"登陆后，你的微博、相册、个人资料会显示在这里，展示给别人"]]
        ]

        
        var viewControllerarr = [UIViewController]()
        for dic in array {
            viewControllerarr.append(contorller(dic: dic))
        }
        viewControllers = viewControllerarr;
        
        
        
    }
    
    private func contorller(dic:[String:Any])->UIViewController{
        //1 取得字典内容
        guard let clsName = dic["clsName"] as? String,
            let title = dic["title"] as? String,
            let imageName = dic["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? ZHZBaseViewController.Type,
            let visitorDic = dic["visitorInfo"] as? [String: String]
            else {
                return UIViewController()
        }

        
        //2 创建视图控制器
        let vc = cls.init()
        vc.title = title
        
        //设置控制器的访客信息字典
        vc.visitorInfoDic = visitorDic
        
        //3 添加图片
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        //4 修改 tabbar 的标题前景色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for:.highlighted)
        //修改字体 系统默认是12号
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: .normal)
        
        // 实例化导航控制器 会调用push 方法 讲rootVC 压栈
        let nav = ZHZNavViewController(rootViewController: vc)
        return nav
    }
 

}
//extension 类似于 OC中的分类 在Swift 中用来切分代码块
//可以把相近功能的函数 放在一个 extension 中 便于代码维护
//注意：和OC中的分类一样 extension 不能定义属性
extension ZHZMainViewController{

    fileprivate func stupBtn(){
        tabBar.addSubview(composeBtn)
        //设置位置
        let count = CGFloat(childViewControllers.count)
        // 将向内缩进宽度
        let w = tabBar.yw_width / count
        //正数 向内部缩进 、负数向外外部扩展  insetBy 左右同时往内缩小
        composeBtn.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        //添加点击事件
        composeBtn.addTarget(self, action: #selector(composeBtnAction), for: .touchUpInside)

     }
    
    @objc fileprivate func composeBtnAction(){
    
        print("点击撰写按钮")

    }
    
    
}

extension ZHZMainViewController:UITabBarControllerDelegate{

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("将要切换到\(viewController)")
        //获取控制器在数组中的索引
        let index  =  childViewControllers.index(of: viewController)
        
        //判断当前索引是首页， 同时index 也是首页 重复点击首页的按钮
        if selectedIndex == 0 && index == selectedIndex {
            print("点击首页")
            //让表格滚到顶部
            let nav = childViewControllers[0] as! UINavigationController
            let vc = nav.childViewControllers[0] as! HomeViewController
            //滚动到顶部
            //            vc.tableView?.setContentOffset(CGPoint(x: 0,y: -64), animated: true)
//            vc.tableView?.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
            
            //刷新数据
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
//                vc.loadData()
//            })
            
            // FIXME:下拉刷新不行
            //            vc.tabBarItem.badgeValue = nil
            //            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        
        
        //判断目标控制器是否是 UIViewController 不包含子类
        return  !viewController.isMember(of: UIViewController.self)

    }
    
}


