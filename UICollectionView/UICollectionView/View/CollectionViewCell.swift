//
//  CollectionViewCell.swift
//  UICollectionView
//
//  Created by Муслим Курбанов on 22.10.2020.
//

import UIKit
import SDWebImage
import Alamofire

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var menu: Menu? {
        didSet {
            nameLabel.text = menu?.brand
            if let image = menu?.imageLink {
                print("didset")
                imageView.image = UIImage(named: image)
            }
        }
    }
    
}
