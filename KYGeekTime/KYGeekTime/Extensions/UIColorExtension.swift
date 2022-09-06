//
//  UIColorExtension.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/20.
//

import Foundation
import UIKit

extension UIColor {
    
    /// 颜色
    /// - Parameters:
    ///   - hexValue: 16进制色值
    ///   - alphaValue: 透明度
    /// - Returns: 颜色
    static func hexColor(_ hexValue: Int, alphaValue: Float) -> UIColor {
        return UIColor(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0x00FF00) >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    /// 颜色
    /// - Parameter hexValue: 16进制色值
    /// - Returns: 颜色
    static func hexColor(_ hexValue: Int) -> UIColor {
        return hexColor(hexValue, alphaValue: 1)
    }
    
    /// 颜色
    /// - Parameters:
    ///   - hexValue: 16进制色值
    ///   - alphaValue: 透明度
    convenience init(_ hexValue: Int, alphaValue: Float) {
        self.init(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0x00FF00) >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    /// 颜色
    /// - Parameter hexValue: 16进制色值
    convenience init(_ hexValue: Int) {
        self.init(hexValue, alphaValue: 1)
    }
    
    /// 颜色转图片
    /// - Returns: 图片
    func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

