//
//  HJCQRCodeViewController.swift
//  新浪微博Swift
//
//  Created by 郝俊聪 on 15/5/15.
//  Copyright (c) 2015年 heima. All rights reserved.
//

import UIKit

class HJCQRCodeViewController: UIViewController {
    @IBOutlet weak var bottomTabBar: UITabBar!
    
    @IBOutlet weak var ScanningBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var sannerHeigthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scaningImageView: UIImageView!
    
    
    @IBAction func clickDismissItem() {
        dismissViewControllerAnimated(false) {
            println("退出")
        }
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置tabbar的代理
        bottomTabBar.delegate = self
        
        //设置默认选中二维码按钮
        bottomTabBar.selectedItem = bottomTabBar.items![0] as? UITabBarItem

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //显示后。开始动画
        scanningAnimation()
    }

    ///冲击波动画
    func scanningAnimation(){
        
        //设置起点
        self.ScanningBottomConstraint.constant = 0
        //更新布局
        view.layoutIfNeeded()
        
        UIView.animateWithDuration(2){
            //设置动画重复次数
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.ScanningBottomConstraint.constant = self.sannerHeigthConstraint.constant*2
            //更新布局
            self.view.layoutIfNeeded()

        }
    
    }

}


extension HJCQRCodeViewController : UITabBarDelegate{
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        
        //根据item的tag确定是哪个按钮
        //设置扫码框的高度
        sannerHeigthConstraint.constant = item.tag == 0 ? 200 : 100
        //刷新布局
        self.view.layoutIfNeeded()
        //移除动画
        self.scaningImageView.layer.removeAllAnimations()
        //开始动画
        scanningAnimation()
        
    }
}
