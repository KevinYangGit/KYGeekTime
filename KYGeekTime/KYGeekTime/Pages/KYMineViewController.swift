//
//  KYMineViewController.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/20.
//

import UIKit
import SnapKit

class KYMineViewController: KYBaseViewController {
    
    var avatarView: UIImageView!
    var accountCell: CommonCell!
    var purchasedCell: CommonCell!
    var dealCell: CommonCell!
    var groupCell: CommonCell!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.title = "我的"
        self.createTopViews()
        self.createFirstGroupCells()
    }
    
    private func createTopViews() {
        let topView = UIView(frame: .zero)
        topView.backgroundColor = .white
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(160)
        }
        
        avatarView = UIImageView(image: R.image.defaultAvatarJpg())
        avatarView.layer.cornerRadius = 60
        avatarView.layer.masksToBounds = true
        topView.addSubview(avatarView)
        avatarView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.width.height.equalTo(120)
        }
        
        let button = UIButton(type: .custom)
        button.setTitle("点击登录", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(UIColor.hexColor(0x333333), for: .normal)
        button.addTarget(self, action: #selector(didClickLoginButton(sender:)), for: .touchUpInside)
        topView.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(15)
            make.top.equalTo(avatarView).offset(15)
        }
    }
    
    private func createFirstGroupCells() {
        accountCell = CommonCell()
        accountCell.title = "账户"
        accountCell.icon = R.image.icon_life()
        view.addSubview(accountCell)
        accountCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(170)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        purchasedCell = CommonCell()
        purchasedCell.title = "已购"
        purchasedCell.icon = R.image.icon_between()
        purchasedCell.addTarget(self, action: #selector(didClickPurchasedCell), for: .touchUpInside)
        view.addSubview(purchasedCell)
        purchasedCell.snp.makeConstraints { make in
            make.top.equalTo(accountCell.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        dealCell = CommonCell()
        dealCell.icon = R.image.icon_live()
        dealCell.title = "商城订单"
        view.addSubview(dealCell)
        dealCell.snp.makeConstraints { make in
            make.top.equalTo(purchasedCell.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        groupCell = CommonCell()
        groupCell.title = "我的拼团"
        groupCell.icon = R.image.icon_document()
        view.addSubview(groupCell)
        groupCell.snp.makeConstraints { make in
            make.top.equalTo(dealCell.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
    }
    
    // 登录
    @objc func didClickLoginButton(sender: UIButton) {
        let loginVC = KYLoginViewController()
        loginVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    // 已购
    @objc func didClickPurchasedCell() {
        let dealVC = KYDealViewController()
        navigationController?.pushViewController(dealVC, animated: true)
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
