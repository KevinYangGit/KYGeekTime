//
//  KYProduct.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/18.
//

import Foundation

/**
 - imageUrl 图片地址
 - name 产品名称
 - desc 产品描述
 - price 产品价格
 - teacher 老师名称
 - total 总数
 - update
 - studentCount 学生数量
 - detail 详情
 - courseList 课程列表
 */
struct KYProduct {
    var imageUrl: String
    var name: String
    var desc: String
    var price: Int
    var teacher: String
    var total: Int
    var update: Int
    var studentCount: Int
    var detail: String
    var courseList: String
}
