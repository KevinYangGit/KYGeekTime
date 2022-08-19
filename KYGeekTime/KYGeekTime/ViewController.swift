//
//  ViewController.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/17.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageView = UIImageView(image: R.image.defaultAvatarJpg())
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
}

