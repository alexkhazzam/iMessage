//
//  ChatViewController.swift
//  iMessage
//
//  Created by Alexander Khazzam on 8/27/22.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var textMessagesTableView: UITableView!
    
    var textMessages: [TextMessage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textMessagesTableView.register(UINib(nibName: K.Text.cellNibName, bundle: nil), forCellReuseIdentifier: K.Text.cellIdentifier)
        
        textMessagesTableView.dataSource = self
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(textMessages)
        return textMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textMessageCell = tableView.dequeueReusableCell(withIdentifier: K.Text.cellIdentifier, for: indexPath) as! TextMessageDetailCell
        
        if textMessages[indexPath.row].sender {
            textMessageCell.textMessageView.backgroundColor = .systemGray3
            textMessageCell.textMessageLabel.textColor = .black
            textMessageCell.textMessageLabel.textAlignment = NSTextAlignment.left
        } else { // why is it necessary to have else clause here?
            textMessageCell.textMessageView.backgroundColor = .systemBlue
            textMessageCell.textMessageLabel.textColor = .white
            textMessageCell.textMessageLabel.textAlignment = NSTextAlignment.right
        }
        
        textMessageCell.textMessageLabel.text = textMessages[indexPath.row].text
        
        return textMessageCell
    }
    
}
