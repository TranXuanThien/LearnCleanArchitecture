//
//  ProductCell.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 9/5/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell, NibReusable {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configView(with: nil)
    }
    
    func configView(with model: ProductViewModel.ProductModel?) {
        if let model = model {
            nameLabel.text = model.product.name
            priceLabel.text = String(model.product.price)
        } else {
            nameLabel.text = ""
            priceLabel.text = ""
        }
    }
    
    @IBAction func editAction(_ sender: Any) {
    }
    
    @IBAction func deleteAction(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
