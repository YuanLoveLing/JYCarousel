//
//  JYCarouselView.swift
//  CarouselDemo
//
//  Created by 靳志远 on 2017/4/19.
//  Copyright © 2017年 靳志远. All rights reserved.
//

import UIKit

fileprivate let JYCarouselViewCellId = "JYCarouselViewCellId"

fileprivate let JYId = "JYId"



class JYCarouselView: UIView {
    
    
    
    @IBOutlet fileprivate weak var myCollectionView: UICollectionView!
    @IBOutlet fileprivate weak var myCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    /// myPageView(对外开放，以方便根据需求修改myPageView样式)
    @IBOutlet weak var myPageView: UIPageControl!
    
    /// 图片数据源
    fileprivate var pictureDataSource: [String] = []
    
    /// 点击单元格回调
    fileprivate var clickCellClosure: ((_ index: Int) -> ())?
    
    /// 记录myCollectionView当前indexPathRow
    fileprivate var indexPathRow: Int = 0
    
    /**
     实例化对象类方法
     pictureDataSource: 图片数据源，如果是网络图片传入图片url数组，如果是本地图片则传入图片名称数组
     clickCellClosure: 点击单元格回调
     */
    class func carouselView(pictureDataSource: [String], clickCellClosure: ((_ index: Int) -> ())?) -> (JYCarouselView?) {
        let view = Bundle.main.loadNibNamed("JYCarouselView", owner: nil, options: nil)?.first as! JYCarouselView
        
        view.pictureDataSource = pictureDataSource
        view.clickCellClosure = clickCellClosure
        
        view.myPageView.numberOfPages = pictureDataSource.count
        
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置collectionView
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: "JYCarouselViewCell", bundle: nil), forCellWithReuseIdentifier: JYCarouselViewCellId)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myCollectionViewFlowLayout.itemSize = myCollectionView.bounds.size
        myCollectionViewFlowLayout.minimumLineSpacing = 0.0
        myCollectionViewFlowLayout.minimumInteritemSpacing = 0.0
        
        // 解决屏幕旋转后分页问题
        let offsetX = myCollectionView.bounds.width * CGFloat(indexPathRow)
        myCollectionView.contentOffset = CGPoint(x: offsetX, y: 0)
    }
}


// MARK: - UICollectionViewDataSource
extension JYCarouselView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureDataSource.count * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: JYCarouselViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: JYCarouselViewCellId, for: indexPath) as! JYCarouselViewCell
        // 注意：由于numberOfItems 是 pictureDataSource.count * 2，所以获取单元格对应的数据源时应该用 indexPath.row % pictureDataSource.count
        let pictureIndex = indexPath.row % pictureDataSource.count
        cell.imageString = pictureDataSource[pictureIndex]
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension JYCarouselView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pictureIndex = indexPath.row % pictureDataSource.count
        if clickCellClosure != nil {
            clickCellClosure!(pictureIndex)
        }
    }
}


// MARK: - UIScrollViewDelegate
extension JYCarouselView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 当前cell索引(第几个单元格)
        indexPathRow = Int(myCollectionView.contentOffset.x / myCollectionView.bounds.width)
        
        if indexPathRow == 0 {// 滚到第一个单元格
            indexPathRow = pictureDataSource.count
            myCollectionView.scrollToItem(at: IndexPath(item: indexPathRow, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
            
        }else if indexPathRow == (pictureDataSource.count * 2 - 1) {// 滚到最后一个单元格
            indexPathRow = pictureDataSource.count - 1
            myCollectionView.scrollToItem(at: IndexPath(item: indexPathRow, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
        }
        
        // 当前图片索引
        let pictureIndex = indexPathRow % pictureDataSource.count
        myPageView.currentPage = pictureIndex
    }
}













