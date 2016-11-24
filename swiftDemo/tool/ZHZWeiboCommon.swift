//
//  ZHZWeiboCommon.swift
//  swiftDemo
//
//  Created by zhanghangzhen on 2016/11/21.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

import Foundation

//MARK: - 全局通知定义
/// 用户需要登录通知
let YWUserShouldLoginNotification = "YWUserShouldLoginNotification"

/// 成功登录通知
let YWuserLoginSuccessedNotification = "YWuserLoginSuccessedNotification"


/// 宏定义宽高；
let SCREEN_W = UIScreen.main.bounds.size.width
let SCREEN_H = UIScreen.main.bounds.size.height

func SCREEN_WIDTH(object:UIView) ->CGFloat{
    
    return object.frame.size.width
}
func SCREEN_HEIGHT(object:UIView) ->CGFloat{
    
    return object.frame.size.height
}

func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    return UIColor(colorLiteralRed: Float(r), green: Float(g), blue: Float(b), alpha: Float(a))
}



//MARK: - 应用程序信息
//应用程序 ID
let YWAppKey = "568898243"
//应用程序加密信息（开发者可以申请修改）
let YWAppSecret = "38a4f8204cc784f81f9f0daaf31e02e3"
//回调地址 登录完成的跳转 URL 参数以 get 形式拼接
let YWRedirectURL = "http://www.sharesdk.cn"

//MARK: - 微博配图视图常量
/// 配图视图外侧的间距
let pictureOutterMargin = CGFloat(12)



/// 配图视图内侧的间距
let pictureInnerMargin = CGFloat(3)

/// 视图 总宽度
let YWStatusPictureViewWidth = UIScreen.yw_screenWidth() - 2 * pictureOutterMargin

/// 每个Item 默认的高宽度
let YWStatusPictureItemWith = (YWStatusPictureViewWidth - CGFloat(2) * pictureInnerMargin)/CGFloat(3)

func ZHZDLog<T>(message:T,fileName:String = #file,methodName:String = #function,lineNum:Int = #line){
    #if DEBUG
        let logStr:String = (fileName as NSString).pathComponents.last!.replacingOccurrences(of: "swift", with: "");
    print("类\(logStr)方法\(methodName)行[\(lineNum)]数据\(message)")
    #endif
}












