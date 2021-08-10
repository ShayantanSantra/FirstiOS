//
//  MyCollectionViewCell.swift
//  Test
//
//  Created by Shayantan Santra on 10/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageview: UIImageView!
    static let identifier = "MyCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(with image: UIImage){
        imageview.image = image
    }
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

}
