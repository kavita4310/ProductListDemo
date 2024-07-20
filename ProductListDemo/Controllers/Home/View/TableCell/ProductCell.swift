//
//  ProductCell.swift
//  ProductListDemo
//
//  Created by kavita chauhan on 13/06/24.
//

import UIKit

protocol ProductCellDelegate{
    func didTapLikeBtn(cell:ProductCell)
}

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!

    var delegate:ProductCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productImg.layer.masksToBounds = false
        productImg.layer.cornerRadius = 10
    }
    

    
}

