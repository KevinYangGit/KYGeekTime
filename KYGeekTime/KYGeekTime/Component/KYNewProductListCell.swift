//
//  KYNewProductListCell.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/9/2.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class KYNewProducctListCell: KYCommonListCell<KYProduct> {
    
    var priceLagel: UILabel
    var productImageView: UIImageView
    
    // 重写父类方法
    override var item: KYProduct? {
        didSet {
            if let p = self.item {
                self.productImageView.kf.setImage(with: URL(string: p.imageUrl))
                self.textLabel?.text = p.name
                self.detailTextLabel?.text = p.desc
                self.priceLagel.text = "¥\(p.price)"
            }
        }
    }
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        priceLagel = UILabel(frame: .zero)
        productImageView = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func setupViews() {
        textLabel?.textColor = UIColor.hexColor(0x333333)
        
        detailTextLabel?.textColor = UIColor.hexColor(0x999999)
        detailTextLabel?.numberOfLines = 2
        
        priceLagel.textColor = UIColor.hexColor(0x333333)
        priceLagel.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(priceLagel)
        
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        contentView.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(100)
        }
        
        textLabel?.snp.makeConstraints({ make in
            make.left.equalTo(productImageView.snp.right).offset(12)
            make.top.equalTo(productImageView)
            make.right.equalTo(contentView).offset(-20)
        })
        
        priceLagel.snp.makeConstraints { make in
            make.left.equalTo(textLabel!)
            make.centerY.equalTo(contentView)
        }
        
        detailTextLabel?.snp.makeConstraints({ make in
            make.left.equalTo(textLabel!)
            make.bottom.equalTo(productImageView)
            make.right.equalTo(contentView).offset(-20)
        })
    }
}
