//
//  KYHomeViewController.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/20.
//

import UIKit
import Kingfisher

class KYHomeViewController: UIViewController, KYBannerViewDelegate, KYBannerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        self.title = "首页"
        self.automaticallyAdjustsScrollViewInsets = false
        
        let bannerView = KYBannerView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 176))
        bannerView.dataSource = self
        bannerView.delegate = self
        bannerView.autoScrollInterval = 2
        view.addSubview(bannerView)
    }
    
    func numberOfBanners(_ bannerView: KYBannerView) -> Int {
        return KYFakeData.createBanners().count
    }
    
    func viewForBanner(_ bannerView: KYBannerView, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView {
            view.kf.setImage(with: URL(string: KYFakeData.createBanners()[index]))
            return view
        } else {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: KYFakeData.createBanners()[index]))
            return imageView
        }
    }
    
    func didSelectBanner(_ bannerView: KYBannerView, index: Int) {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
