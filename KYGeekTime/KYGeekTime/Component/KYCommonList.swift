//
//  KYCommonList.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/9/2.
//

import Foundation
import UIKit
import SnapKit

class KYCommonListCell<ItemType>: UITableViewCell {
    var item: ItemType?
    
    // 要求子类必须重写该方法
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class KYCommonList<ItemType, CellType: KYCommonListCell<ItemType>>: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView
    var items: [ItemType]! = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self;
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CellType? = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") as? CellType
        if cell == nil {
            cell = CellType(style: .subtitle, reuseIdentifier: "UITableViewCell")
        }
        cell?.item = items[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
