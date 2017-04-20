//
//  onlineCarouselViewController.swift
//  JYCarousel
//
//  Created by 靳志远 on 2017/4/20.
//  Copyright © 2017年 靳志远. All rights reserved.
//

import UIKit

class onlineCarouselViewController: UIViewController {
    
    fileprivate var carousalView: JYCarouselView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        view.autoresizesSubviews = false
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        carousalView = JYCarouselView.carouselView(pictureDataSource: pictureDataSource, clickCellClosure: { (index) in
            print("点击了第\(index)张图片")
        })
        carousalView?.myPageView.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 0.4509803922, blue: 1, alpha: 1)
        carousalView?.myPageView.pageIndicatorTintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        view.addSubview(carousalView!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        carousalView?.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 200)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - lazy
    /// 网络数据源
    fileprivate lazy var pictureDataSource: [String] = {
        return ["http://ww4.sinaimg.cn/mw690/9bbc284bgw1fb29llpshkj20m80dwjt6.jpg",
                "http://ww4.sinaimg.cn/mw690/9bbc284bgw1fb29lnhmypj20m80gojtg.jpg",
                "http://ww1.sinaimg.cn/mw690/9bbc284bgw1fb29loe46cj20m80go77l.jpg"]
    }()
    
    deinit {
        print("\(#file)88")
    }
}
