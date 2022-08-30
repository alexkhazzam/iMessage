//
//  AllMessagesDetailCellTableViewCell.swift
//  iMessage
//
//  Created by Alexander Khazzam on 8/30/22.
//

import UIKit

class AllMessagesDetailCell: UITableViewCell {

    @IBOutlet weak var userIconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastTextLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var muteImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
