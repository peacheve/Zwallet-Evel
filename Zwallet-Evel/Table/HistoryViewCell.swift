//
//  HistoryViewCell.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 21/08/23.
//

import UIKit

class HistoryViewCell: UITableViewCell {
    @IBOutlet weak var imageTableView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
