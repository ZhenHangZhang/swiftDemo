//
//  YWDemoViewController.swift
//  swiftDemo
//
//  Created by zhanghangzhen on 2016/11/23.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

import UIKit

class YWDemoViewController: ZHZBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第\(navigationController?.childViewControllers.count ?? 0)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc fileprivate func showNextAction(){
        let vc = YWDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension YWDemoViewController {
    
    override func steupTableView() {
        super.steupTableView()
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", fontSize: 16, target: self, action: #selector(showNextAction))
        
    }
}
