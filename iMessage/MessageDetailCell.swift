//
//  MessageDetailCell.swift
//  iMessage
//
//  Created by Alexander Khazzam on 8/28/22.
//

import UIKit

class MessageDetailCell: UITableViewCell {

    @IBOutlet weak var messageTitleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
