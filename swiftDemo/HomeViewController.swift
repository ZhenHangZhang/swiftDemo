
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
