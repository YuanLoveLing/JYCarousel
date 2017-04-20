//
//  ViewController.swift
//  JYCarousel
//
//  Created by 靳志远 on 2017/4/20.
//  Copyright © 2017年 靳志远. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var carousalView: JYCarouselView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carousalView = JYCarouselView.carouselView(pictureDataSource: pictureDataSource, clickCellClosure: { (index) in
            print("点击了第\(index)张图片")
        })
        carousalView?.myPageView.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 0.4509803922, blue: 1, alpha: 1)
        carousalView?.myPageView.pageIndicatorTintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        view.addSubview(carousalView!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let x = 0
        let y = 100
        let w = view.bounds.width
        let h = 200
        carousalView?.frame = CGRect(x: x, y: y, width: Int(w), height: h)
    }
    
    // MARK: - lazy
    //    fileprivate lazy var pictureDataSource: [String] = {
    //        return ["wheelPicture0",
    //                "wheelPicture1",
    //                "wheelPicture2",
    //                "wheelPicture3",
    //                "wheelPicture4"]
    //
    //    }()
    
    fileprivate lazy var pictureDataSource: [String] = {
        return ["http://ww4.sinaimg.cn/mw690/9bbc284bgw1fb29llpshkj20m80dwjt6.jpg",
                "http://ww4.sinaimg.cn/mw690/9bbc284bgw1fb29lnhmypj20m80gojtg.jpg",
                "http://ww1.sinaimg.cn/mw690/9bbc284bgw1fb29loe46cj20m80go77l.jpg"]
    }()
}










