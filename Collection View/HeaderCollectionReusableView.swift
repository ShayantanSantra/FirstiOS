//
//  HeaderCollectionReusableView.swift
//  Test
//
//  Created by Shayantan Santra on 11/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
   static let identifier = "HeaderCollectionReusableView"
    private var label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    public func configure(){
        backgroundColor = .green
        addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
class FooterCollectionReusableView: UICollectionReusableView {
   static let identifier = "FooterCollectionReusableView"
    private var label: UILabel = {
        let label = UILabel()
        label.text = "footer"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    public func configure(){
        backgroundColor = .green
        addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
