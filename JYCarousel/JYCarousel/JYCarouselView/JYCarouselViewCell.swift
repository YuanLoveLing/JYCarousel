//
//  JYCarouselViewCell.swift
//  CarouselDemo
//
//  Created by 靳志远 on 2017/4/19.
//  Copyright © 2017年 靳志远. All rights reserved.
//

import UIKit

class JYCarouselViewCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var imgView: UIImageView!
    
    /// 图片名称或图片链接
    var imageString: String? {
        didSet {
            guard let imageString = imageString else {
                return
            }
            
            if imageString.hasPrefix("http") || imageString.hasPrefix("https") {// 在线图片
                guard let url = URL(string: imageString) else {
                    return
                }
                imgView.sd_setImage(with: url)
                
            }else {// 本地图片
                imgView.image = UIImage(named: imageString)
            }
        }
    }
}


