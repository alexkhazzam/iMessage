//
//  TextMessageDetailCell.swift
//  iMessage
//
//  Created by Alexander Khazzam on 8/30/22.
//

import UIKit

class TextMessageDetailCell: UITableViewCell {
    
    @IBOutlet weak var textMessageView: UIView!
    @IBOutlet weak var textMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textMessageView.setRoundedBorders()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
