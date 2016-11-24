
//
//  HomeViewController.swift
//  swiftDemo
//
//  Created by zhanghangzhen on 2016/11/21.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

import UIKit


//原创微博可重用 cell
private let originalcellID = "originalcellID"
//转发微博的可重用 cell
private let retweetedCellID = "retweetedCellID"



/// private :访问级别所修饰的属性或者方法只能在当前类里访问

/// fileprivate ：访问级别所修饰的属性和方法只能在当前swift源文件里面使用

/// internal  ：默认访问级别，可写可不写，internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。internal可以省略，默认的访问限定就是internal，如果是App代码，也是在整个App代码，也是在整个App内部可以访问

/// public ：可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。

/// open  ：可以被任何人使用，包括override和继承。


/// 从高到低排序如下：open >public> interal > fileprivate >private
class HomeViewController: ZHZBaseViewController {
    //列表视图模型
    fileprivate lazy var listViewModel = YWStatusListViewModel()
    /// 加载数据
    override func loadData() {
        // Xcode 8.0 的刷新控件，beginRefreshing 方法，什么都不显示！
        refreshControl?.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1){
        self.listViewModel.loadStatud(isPullup: self.isPullup, completion: { (isSuccess, shouldRefresh) in
            //结束刷新
            self.refreshControl?.endRefreshing()
            
            //消除tabBarItem.badgeValue
            if self.isPullup == false {
                //清除 tabItem 的 badgeNumber
                self.navigationController?.tabBarItem.badgeValue = nil
                //                self.tabBarController?.tabBarItem.badgeValue = nil
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
            //恢复上拉刷新标记
            self.isPullup = false
            
            if shouldRefresh {
                //刷新表格
                self.tableView?.reloadData()
            }
        })
        }
    }
    @objc fileprivate func showFriendAction(){
        let vc = YWDemoViewController()
        //vc.hidesBottomBarWhenPushed = true
        //push 动作是nav 做的
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController{

    override func steupTableView() {
        super.steupTableView()
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriendAction))
        //注册原型cell 注意： 这里的 YWStatusNormalCell 是empty 建立的
        //原创微博Cell
        tableView?.register( UINib(nibName: "YWStatusNormalCell", bundle: nil), forCellReuseIdentifier: originalcellID)
        
        //转发微博Cell
        tableView?.register(UINib(nibName: "YWStatusRetweedCell", bundle: nil), forCellReuseIdentifier: retweetedCellID)
        
        steupNavTitle()
        
        //        //设置行高  自动计算rowHeight跟estimatedRowHeight到底是有什么仇，如果不加上估算高度的设置，自动算高就失效了。
        //        tableView?.rowHeight = UITableViewAutomaticDimension
        //        //估算高度的设置
        //        tableView?.estimatedRowHeight = 380
        
        //取消分割线
        tableView?.separatorStyle = .none
    }
    
    //设置导航栏标题
    fileprivate func steupNavTitle() {
        
        let btn = YWTitleButton(title: ZHZNetworkManager.shared.userAccount.screen_name)
        navItem.titleView = btn
        btn.addTarget(self, action: #selector(titleBtnAction), for: .touchUpInside)
        
    }
    @objc private func titleBtnAction(btn:UIButton){
        //设置选中状态
        btn.isSelected = !btn.isSelected
        
    }

}
extension HomeViewController{

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.statusList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = listViewModel.statusList[indexPath.row]
        let cellID = viewModel.status.retweeted_status == nil ? originalcellID : retweetedCellID
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! YWStatusCell
        cell.viewModel = viewModel
        //设置代理
        cell.delegate = self
        return cell
    }
    ///父类必须实现代理方法 子类才能重写 Swift 3.0 如此 2.0 不需要
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let viewModel = listViewModel.statusList[indexPath.row]
        
        return viewModel.rowHeight
    }
}
extension HomeViewController:YWStatusCellDelegate{
    func statusCellDidTapURLString(cell: YWStatusCell, urlString: String) {
        let vc = YWWebViewController()
        vc.urlString = urlString
        navigationController?.pushViewController(vc, animated: true)
    }
}


















