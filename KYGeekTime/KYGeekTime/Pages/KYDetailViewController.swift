//
//  KYDetailViewController.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/23.
//

import UIKit
import Kingfisher
import SnapKit

class KYDetailViewController: KYBaseViewController {

    var product: KYProduct!
    var avatarView: UIImageView!
    var nameLabel: UILabel!
    var descLabel: UILabel!
    var teacherLabel: UILabel!
    var courseCountLabel: UILabel!
    var studentCountLabel: UILabel!
    var tab: Tab!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.createTop()
        
        self.createMiddle()
        
        self.createBottom()
    }
    
    func createTop() {
        let topView = UIView()
    }
    
    func createMiddle() {
        tab = Tab(items: ["课程介绍", "课程目录"])
        view.addSubview(tab)
        tab.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    func createBottom() {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("购买 ¥\(product.price)", for: .normal)
        button.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        button.addTarget(self, action: #selector(didClickBuyButton(button:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    @objc func didClickBuyButton(button: UIButton) {
        
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
