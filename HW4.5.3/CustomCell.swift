//
//  TestCell.swift
//  Lesson4.5.8.1.2022
//
//  Created by Azamat Sarinzhiev on 9/1/22.
//

import Foundation
import UIKit
import SnapKit

class TestCell: UITableViewCell {
    
    static let identifier = "TestCell"
    
    lazy var titleName: UILabel = {
        let view = UILabel()
        return view
    }()
    lazy var titleIndex: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(titleName)
        titleName.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        addSubview(titleIndex)
        titleIndex.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
        }
    }
    
}
