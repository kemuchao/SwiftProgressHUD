//
//  ViewController.swift
//  swift菊花
//
//  Created by MuChao Ke on 16/11/1.
//  Copyright © 2016年 MuChao Ke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func show(_ sender: AnyObject) {
        SwiftProgressHUD.show(view:self)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            SwiftProgressHUD.dismiss()
        }
    }
    
    @IBAction func showWithStatus(_ sender: AnyObject) {
        SwiftProgressHUD.showWithStatus(view: self, status: "加载中...", statusSize: UIFont.systemFont(ofSize: 13))
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            SwiftProgressHUD.dismiss()
        }
    }
    
    
    @IBAction func showError(_ sender: AnyObject) {
        SwiftProgressHUD.showError(view: self)
    }
    
    @IBAction func showErrorWithStatus(_ sender: AnyObject) {
        SwiftProgressHUD.showErrorWithStatus(view: self, status: "网络错误")
    }
    
    @IBAction func showSuccess(_ sender: AnyObject) {
        SwiftProgressHUD.showSuccess(view: self)
    }
    @IBAction func showSuccessWithStatus(_ sender: AnyObject) {
        SwiftProgressHUD.showSuccessWithStatus(view: self, status: "请求成功")
    }
    
    
    @IBAction func showImage(_ sender: AnyObject) {
        SwiftProgressHUD.showImage(view: self, image:UIImage(named: "mm.png")!)
    }
    
    @IBAction func showImageWithStatus(_ sender: AnyObject) {
        SwiftProgressHUD.showImageWithStatus(view: self,image:UIImage(named: "mm.png")!, status: "自定义图片")
    }
    
    @IBAction func showInfoWithStatus(_ sender: AnyObject) {
        SwiftProgressHUD.showInfoWithStatus(view: self, status: "您有未填写的表单")
    }
    @IBAction func showMessage(_ sender: AnyObject) {
        SwiftProgressHUD.showWithMessage(view: self, message: "这是message提示")
    }
}

