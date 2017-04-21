//
//  ViewController.swift
//  JYCarousel
//
//  Created by 靳志远 on 2017/4/20.
//  Copyright © 2017年 靳志远. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// 本地图片轮播
    @IBAction func localCarouselButtonDidClick(_ sender: Any) {
        let vc = localCarouselViewController()
        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
    }
    
    /// 在线图片轮播
    @IBAction func onlineCarouselButtonDidClick(_ sender: Any) {
        let vc = onlineCarouselViewController()
        present(vc, animated: true, completion: nil)
    }
    

}










