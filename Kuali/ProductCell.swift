//
//  ProductCell.swift
//  Kuali
//
//  Created by Daniela Anguiano on 11/19/18.
//  Copyright © 2018 Daniela Anguiano. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var nameProducto: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var numberLikesProduct: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
