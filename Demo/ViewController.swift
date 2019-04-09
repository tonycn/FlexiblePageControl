//
//  ViewController.swift
//  Demo
//
//  Created by 島仁誠 on 2017/04/04.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollSize: CGFloat = 300
    let numberOfPage: Int = 10

    let pageControl1 = FlexiblePageControl()

    @IBOutlet weak var pageControl2: FlexiblePageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollSize, height: scrollSize)
        scrollView.center = view.center
        scrollView.contentSize = CGSize(width: scrollSize * CGFloat(numberOfPage), height: scrollSize)
        scrollView.isPagingEnabled = true
        
        pageControl1.center = CGPoint(x: scrollView.center.x, y: scrollView.frame.maxY + 16)
        pageControl1.numberOfPages = numberOfPage
        pageControl1.displayCount = 5;
        pageControl1.currentPage = numberOfPage - 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.pageControl1.currentPage = self.numberOfPage - 2
        })

        pageControl2.numberOfPages = numberOfPage
        

        for index in  0..<numberOfPage {
            let view = UIImageView(frame: CGRect(x: CGFloat(index) * scrollSize, y: 0, width: scrollSize, height: scrollSize))
            let imageNamed = NSString(format: "image%02d.jpg", index % 10)
            view.image = UIImage(named: imageNamed as String)
            scrollView.addSubview(view)
        }

        view.addSubview(scrollView)
        view.addSubview(pageControl1)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        pageControl1.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
        pageControl2.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
    }
}
