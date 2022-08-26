//
//  Tab.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/23.
//

import Foundation
import UIKit
import SnapKit

class Tab: UIView {
    var items: [String]
    var itemButtons: [UIButton]
    var selectedItemButton: UIButton!
    var indicatorView: UIView!
    var selectedColor: UIColor? {
        didSet {
            if let color = self.selectedColor {
                self.indicatorView.backgroundColor = color
                itemButtons.forEach { button in
                    button.setTitleColor(color, for: .selected)
                }
            } else {
                self.indicatorView.backgroundColor = UIColor.hexColor(0xf8892e)
                itemButtons.forEach { button in
                    button.setTitleColor(UIColor.hexColor(0xf8892e), for: .selected)
                }
            }
        }
    }
    var normalColor: UIColor? {
        didSet {
            if let color = self.normalColor {
                itemButtons.forEach { button in
                    button.setTitleColor(color, for: .normal)
                }
            } else {
                itemButtons.forEach { button in
                    button.setTitleColor(UIColor.hexColor(0x333333), for: .normal)
                }
            }
        }
    }
    
    init?(items: [String]) {
        if items.count == 0 {
            return nil
        }
        self.items = items
        itemButtons = []
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        var lastView: UIView?
        for index in 0..<items.count {
            let button = UIButton(type: .custom)
            button.setTitle(items[index], for: .normal)
            button.setTitleColor(UIColor.hexColor(0x333333), for: .normal)
            button.setTitleColor(UIColor.hexColor(0xf8892e), for: .selected)
            self.addSubview(button)
            
            button.snp.makeConstraints { make in
                if index == 0 {
                    make.left.equalToSuperview()
                } else {
                    make.left.equalTo(lastView!.snp.right)
                    make.width.equalTo(lastView!)
                }
                make.top.bottom.equalToSuperview()
                if index == items.count - 1 {
                    make.right.equalToSuperview()
                }
            }
            lastView = button
            button.addTarget(self, action: #selector(didClickButton(sender:)), for: .touchUpInside)
            itemButtons.append(button)
            
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.borderWidth = 1
            
            if index == 0 {
                selectedItemButton = button
                button.isSelected = true
            }
        }
        indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.hexColor(0xf8892e)
        self.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.centerX.equalTo(selectedItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(4)
        }
    }
    
    @objc func didClickButton(sender: UIButton) {
        guard sender != selectedItemButton else {
            return
        }
        selectedItemButton.isSelected = false
        sender.isSelected = true
        selectedItemButton = sender
        self.indicatorView.snp.remakeConstraints { make in
            make.centerX.equalTo(selectedItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(4)
        }
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
}
