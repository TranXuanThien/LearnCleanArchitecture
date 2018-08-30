//
//  MenuCell.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/30/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit
import Reusable

class MenuCell: UITableViewCell, NibReusable {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configView(with: nil)
    }

    func configView(with model: MainViewModel.MenuModel?) {
        guard let model = model else {
            titleLabel.text = ""
            return
        }
        titleLabel.text = model.menu.description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
