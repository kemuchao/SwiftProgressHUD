//
//  SwiftProgressHUD.swift
//  swift菊花
//
//  Created by MuChao Ke on 16/11/1.
//  Copyright © 2016年 MuChao Ke. All rights reserved.
//  QQ 751776424
//

import UIKit

class SwiftProgressHUD: UIView {
   
    private static let activityBg = UIView()
    private static let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    
    private static let errorImage = UIImageView()
    
    public static var contentLabel = UILabel()

    var hudwidth = 0;
    var hudheight = 0;
    
    private static var type = showType.show
    
    private static var bgColor = UIColor.gray
    
    private static var frameT = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    enum showType: String {
        case show                    = "show"
        case showWithStatus          = "showWithStatus"
        case showError               = "showError"
        case showErrorWithStatus     = "showErrorWithStatus"
        case showSuccess             = "showSuccess"
        case showSuccessWithStatus   = "showSuccessWithStatus"
        case showImage               = "showImage"
        case showImageWithStatus     = "showImageWithStatus"
        case showInfoWithStatus      = "showInfoWithStatus"
        case showWithMessage         = "showWithMessage"
    }

    //设置背景颜色
    class func setBackgroundColor(color:UIColor){
         bgColor = color
    }

    
    //转圈，不会自动隐藏
    class func show(view:UIViewController){
        type = showType.show
        sharedView(view: view)
    }
    
    // 文字，转圈，不会自动隐藏
    class func showWithStatus(view:UIViewController,status:String){
        type = showType.showWithStatus
        sharedViewWithStatus(view: view, status: status)
    }

    // 文字，转圈，不会自动隐藏 可设置文字大小
    class func showWithStatus(view:UIViewController,status:String,statusSize:UIFont){
        type = showType.showWithStatus
        sharedViewWithStatus(view: view, status: status, font: statusSize)
    }

    //错误提示 自动隐藏
    class func showError(view:UIViewController){
        type = showType.showError
        sharedViewError(view: view)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            dismiss()
        }
    }
    //错误提示+文字 自动隐藏
    class func showErrorWithStatus(view:UIViewController, status:String){
        type = showType.showErrorWithStatus
        sharedViewWErrorWithStatus(view: view ,status: status)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            dismiss()
        }
    }
    
    //成功提示 自动隐藏
    class func showSuccess(view:UIViewController){
        type = showType.showSuccess
        sharedViewSuccess(view: view)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            dismiss()
        }
    }
    
    //成功提示+文字 自动隐藏
    class func showSuccessWithStatus(view:UIViewController, status:String){
        type = showType.showSuccessWithStatus
        sharedViewSuccessWithStatus(view: view ,status: status)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            dismiss()
        }
    }
    
    //自定义图片 自动隐藏
    class func showImage(view:UIViewController, image:UIImage){
        type = showType.showImage
        sharedViewImage(view: view, image:image)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            dismiss()
        }

    }
    
    //自定义图片+文字 自动隐藏
    class func showImageWithStatus(view:UIViewController, image:UIImage, status:String){
        type = showType.showImageWithStatus
        sharedViewImageithStatus(view: view, image:image, status: status)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            dismiss()
        }
    }
    

    
    //有叹号 下面是文字 自动隐藏
    class func showInfoWithStatus(view:UIViewController, status:String){
        type = showType.showInfoWithStatus
        sharedViewInfoWithStatus(view: view,  status: status)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            dismiss()
        }
    }

    //有叹号 下面是文字 自动隐藏
    class func showWithMessage(view:UIViewController, message:String){
        type = showType.showWithMessage
        sharedViewInfoWithMessage(view: view,  message: message)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            dismiss()
        }
    }

    
    

    class func dismiss(){
        tools.removeFromSuperview()
    }
    
    
    static let tools:SwiftProgressHUD = {
        let t = SwiftProgressHUD();
        
        return t;
    }()
    
    
    class func setView(){
        activityBg.layer.cornerRadius = 6;
        activityBg.alpha = 0.9
        activityBg.layer.masksToBounds = true;
        activityBg.backgroundColor = bgColor
        
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.black
        contentLabel.textAlignment = NSTextAlignment.center
        contentLabel.font = UIFont.systemFont(ofSize: 13)

        switch type {
        case .show:
            errorImage.removeFromSuperview()
            contentLabel.removeFromSuperview()
            let transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            activity.transform = transform;
            activity.color = UIColor.black
            activity.startAnimating()
            activityBg.addSubview(activity)
            tools.addSubview(activityBg)
            break
            
        case .showWithStatus:
            errorImage.removeFromSuperview()
        
        let transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            activity.transform = transform;
            activity.color = UIColor.black
            activity.startAnimating()
            activityBg.addSubview(activity)
            activityBg.addSubview(contentLabel)
            tools.addSubview(activityBg)
        break
            
        case .showError:
        
            contentLabel.removeFromSuperview()
            activity.removeFromSuperview()
            
            activityBg.addSubview(errorImage)
            tools.addSubview(activityBg)
            break
        case .showErrorWithStatus:
            
            activity.removeFromSuperview()
            activityBg.addSubview(contentLabel)
            activityBg.addSubview(errorImage)
            tools.addSubview(activityBg)
            break
        case .showSuccess:
            
            contentLabel.removeFromSuperview()
            activity.removeFromSuperview()
            
            activityBg.addSubview(errorImage)
            tools.addSubview(activityBg)
            break

        case .showSuccessWithStatus:
            
            activity.removeFromSuperview()
            activityBg.addSubview(contentLabel)
            activityBg.addSubview(errorImage)
            tools.addSubview(activityBg)
            break
        case .showImage:
            
            contentLabel.removeFromSuperview()
            activity.removeFromSuperview()
            
            activityBg.addSubview(errorImage)
            tools.addSubview(activityBg)
            break

        case .showImageWithStatus:
            
            activity.removeFromSuperview()
            activityBg.addSubview(contentLabel)
            activityBg.addSubview(errorImage)
            tools.addSubview(activityBg)
            break
        case .showInfoWithStatus:
            
            activity.removeFromSuperview()
            activityBg.addSubview(contentLabel)
            activityBg.addSubview(errorImage)
            tools.addSubview(activityBg)
            break
        case .showWithMessage:
            activity.removeFromSuperview()
            errorImage.removeFromSuperview()
            activityBg.addSubview(contentLabel)
            tools.addSubview(activityBg)
            break
            
        }
    

    }

    
    class func sharedView(view:UIViewController){
        setView()
        contentLabel.alpha = 0
        
        activityBg.frame = CGRect(x: (view.view.frame.width-130)/2, y: (view.view.frame.height-100)/2, width: 130, height: 90)
        
        activity.frame = CGRect(x: 0, y: 0, width: 130, height: 90)
        
        tools.frame = view.view.bounds
        
        view.view.addSubview(tools)
    }
    
    class func sharedViewWithStatus(view:UIViewController,status:String){
        setView()
        tools.frame = view.view.bounds
        contentLabel.alpha = 1
        contentLabel.textAlignment = NSTextAlignment.center
        activityBg.frame = CGRect(x: (view.view.frame.width-130)/2, y: (view.view.frame.height-100)/2, width: 130, height: 100)
        
        activity.frame = CGRect(x: 0, y: 0, width: 130, height: 80)
        contentLabel.frame = CGRect(x: 0, y: activity.frame.maxY-10, width: 130, height:20)
    
        if status .isEmpty  {
            
            switch type {
            case .show:
                 contentLabel.text = "Loading"
                break
            case .showWithStatus:
                contentLabel.text = "Loading"
                break
            case .showError:
               contentLabel.text = "请求出错"
                break
            case .showErrorWithStatus:
                contentLabel.text = "请求出错"
                break
            case .showSuccess:
                contentLabel.text = "请求成功"
                break
            default:
                break
            }
        }else{
            contentLabel.text = status
        }
        
        view.view.addSubview(tools)

    }
    
    class func sharedViewWithStatus(view:UIViewController,status:String, font:UIFont){
        
        sharedViewWithStatus(view: view, status: status)
        contentLabel.font = font
    }
    
    class func sharedViewError(view:UIViewController){
        setView()
        errorImage.image = UIImage(named: "error.png")
        errorImage.frame =  CGRect(x: (110 - 40)/2, y: (90-40)/2, width: 40, height: 40)
        activityBg.frame = CGRect(x: (view.view.frame.width-110)/2, y: (view.view.frame.height-90)/2, width: 110, height: 90)
        tools.frame = view.view.bounds
        view.view.addSubview(tools)
    }

    class func sharedViewWErrorWithStatus(view:UIViewController, status:String){
        setView()
        errorImage.image = UIImage(named: "error.png")
        sharedViewWithStatus(view: view, status: status)
        errorImage.frame =  CGRect(x: (130 - 30)/2, y: (100-30)/2-10, width: 30, height: 30)
        
        tools.frame = view.view.bounds
        view.view.addSubview(tools)
    }
    
    class func sharedViewSuccess(view: UIViewController){
        setView()
        sharedViewError(view: view)
       
        errorImage.image = UIImage(named: "success.png")
    }
    
    class func sharedViewSuccessWithStatus(view: UIViewController ,status: String){
        setView()
        sharedViewWErrorWithStatus(view: view, status: status)
        errorImage.image = UIImage(named: "success.png")
    }
    
    class func sharedViewImage(view: UIViewController,image: UIImage) {
        setView()
        sharedViewError(view: view)
        errorImage.image = image
    }
    class func sharedViewImageithStatus(view: UIViewController ,image: UIImage ,status: String){
        setView()
        sharedViewWErrorWithStatus(view: view, status: status)
        errorImage.image = image
    }
    
    class func sharedViewInfo(view: UIViewController){
        setView()
        errorImage.image = UIImage(named: "info.png")
        errorImage.frame =  CGRect(x: (130 - 25)/2, y: (100-25)/2-10, width: 25, height: 25)
        
        tools.frame = view.view.bounds
        view.view.addSubview(tools)
    }

    
    class func sharedViewInfoWithStatus(view: UIViewController ,status: String){
        setView()
        errorImage.image = UIImage(named: "info.png")
        sharedViewWithStatus(view: view, status: status)
        errorImage.frame =  CGRect(x: (130 - 25)/2, y: (100-25)/2-10, width: 25, height: 25)
        
        tools.frame = view.view.bounds
        view.view.addSubview(tools)
    }
    
    class func sharedViewInfoWithMessage(view: UIViewController ,message: String){
        setView()

        sharedViewWithStatus(view: view, status: message)
        activityBg.frame = CGRect(x: (view.view.frame.width-200)/2, y: (view.view.frame.height-100)/2, width: 200, height: 100)
        contentLabel.frame = CGRect(x: 5, y: 5, width: activityBg.frame.width-10, height: activityBg.frame.height-10)
        
        tools.frame = view.view.bounds
        view.view.addSubview(tools)
    }

    
}
