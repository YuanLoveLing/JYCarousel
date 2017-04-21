//
//  localCarouselViewController.swift
//  JYCarousel
//
//  Created by 靳志远 on 2017/4/20.
//  Copyright © 2017年 靳志远. All rights reserved.
//

import UIKit

class localCarouselViewController: UIViewController {
    
    fileprivate var carousalView: JYCarouselView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        // 如果当前控制器有导航，应该设置automaticallyAdjustsScrollViewInsets为false否则UICollectonView的layout会有问题
        automaticallyAdjustsScrollViewInsets = false
        
        /******************** 基本用法 ********************/
        carousalView = JYCarouselView.carouselView(pictureDataSource: pictureDataSource, clickCellClosure: { (index) in
            print("点击了第\(index)张图片")
        })
        carousalView?.myPageView.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 0.4509803922, blue: 1, alpha: 1)
        carousalView?.myPageView.pageIndicatorTintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        view.addSubview(carousalView!)
        /******************** 基本用法 ********************/
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        carousalView?.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: view.bounds.height - 200)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - lazy
    /// 本地数据源
    fileprivate lazy var pictureDataSource: [String] = {
        return ["wheelPicture0",
                "wheelPicture1",
                "wheelPicture2",
                "wheelPicture3",
                "wheelPicture4"]
        
    }()
    
    deinit {
        print("\(#file)88")
    }
}














