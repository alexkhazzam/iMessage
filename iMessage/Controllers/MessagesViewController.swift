//
//  MessagesViewController.swift
//  iMessage
//
//  Created by Alexander Khazzam on 8/27/22.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var messagesTableView: UITableView!
    
    let messages: [Message] = [
        Message(title: "All Messages", icon: "message", controller: "goToAllMessages"),
        Message(title: "Known Senders", icon: "person.circle", controller: "goToKnownSenders"),
        Message(title: "Unknown Senders", icon: "person.crop.circle.badge.questionmark.fill", controller: "goToUnknownSenders")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesTableView.register(UINib(nibName: K.Messages.cellNibName, bundle: nil), forCellReuseIdentifier: K.Messages.cellIdentifier)
        
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
    }

}

extension MessagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: messages[indexPath.row].controller, sender: self)
    }
    
}

extension MessagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageCell = tableView.dequeueReusableCell(withIdentifier: K.Messages.cellIdentifier, for: indexPath) as! MessageDetailCell
        
        messageCell.messageTitleLabel.text = messages[indexPath.row].title
        messageCell.iconImageView.image = UIImage(systemName: messages[indexPath.row].icon)
        
        return messageCell
    }
    
}
