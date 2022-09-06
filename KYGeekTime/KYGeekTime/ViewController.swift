//
//  ViewController.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/17.
//

import UIKit
import SnapKit

//class ViewController: UIViewController {
class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tabBar.backgroundColor = UIColor.white
        
        // 设置导航栏样式（白底黑字）
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowImage = UIImage()
        appearance.shadowColor = nil
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        let homeVC = KYHomeViewController()
        homeVC.tabBarItem.image = R.image.home()
        homeVC.tabBarItem.selectedImage = R.image.home_selected()
        homeVC.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.hexColor(0x333333)], for: .selected)
        homeVC.tabBarItem.title = "首页"
        let navHomeVC = UINavigationController(rootViewController: homeVC)
        navHomeVC.navigationBar.standardAppearance = appearance
        navHomeVC.navigationBar.scrollEdgeAppearance = appearance
        navHomeVC.navigationBar.isTranslucent = false
        self.addChild(navHomeVC)
        
        let mineVC = KYMineViewController()
        mineVC.tabBarItem.image = R.image.mine()
        mineVC.tabBarItem.selectedImage = R.image.mine_selected()
        mineVC.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.hexColor(0x333333)], for: .selected)
        mineVC.tabBarItem.title = "我的"
        let navMineVC = UINavigationController(rootViewController: mineVC)
        navMineVC.navigationBar.standardAppearance = appearance
        navMineVC.navigationBar.scrollEdgeAppearance = appearance
        navMineVC.navigationBar.isTranslucent = false
        self.addChild(navMineVC)
        
//        let imageView = UIImageView(image: R.image.defaultAvatarJpg())
//        view.addSubview(imageView)
//
//        imageView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(200)
//        }
    }
}

