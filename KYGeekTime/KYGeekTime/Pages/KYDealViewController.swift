//
//  KYDealViewController.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/9/2.
//

import UIKit
import SnapKit

class KYDealViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupViews()
    }
    
    func setupViews() {
        let dealList = KYCommonList<KYProduct, KYProductListCell>(frame: .zero)
        dealList.items = KYFakeData.createProducts()
        view.addSubview(dealList)
        dealList.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
