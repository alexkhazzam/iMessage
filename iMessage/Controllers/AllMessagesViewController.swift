//
//  ViewController.swift
//  iMessage
//
//  Created by Alexander Khazzam on 8/27/22.
//

import UIKit

class AllMessagesViewController: UIViewController {

    @IBOutlet weak var allMessagesTableView: UITableView!
    
    let chats: [Chat] = [
        Chat(name: "Alexander", lastText: "Ok, see you then.", time: "10:04 AM", muted: true),
        Chat(name: "Larry", lastText: "Ok, see you then.", time: "10:05 AM", muted: false),
        Chat(name: "Natasha", lastText: "Ok, see you then.", time: "10:06 AM", muted: true),
        Chat(name: "Matthew", lastText: "Ok, see you then.", time: "10:07 AM", muted: false),
        Chat(name: "Sharon", lastText: "Ok, see you then.", time: "10:08 AM", muted: true),
        Chat(name: "Adam", lastText: "Ok, see you then.", time: "10:04 AM", muted: false),
        Chat(name: "Aaron", lastText: "Ok, see you then.", time: "10:09 AM", muted: true),
        Chat(name: "Jason", lastText: "Ok, see you then.", time: "10:10 AM", muted: false),
        Chat(name: "Andrea", lastText: "Ok, see you then.", time: "10:11 AM", muted: true),
        Chat(name: "Bebita", lastText: "Ok, see you then.", time: "10:12 AM", muted: false),
        Chat(name: "Maxi", lastText: "Ok, see you then.", time: "10:13 AM", muted: true),
        Chat(name: "Jonathan", lastText: "Ok, see you then.", time: "10:14 AM", muted: false),
        Chat(name: "Joey", lastText: "Ok, see you then.", time: "10:15 AM", muted: true),
        Chat(name: "Brandon", lastText: "Ok, see you then.", time: "10:16 AM", muted: false)
    ]
    
    var selectedRowIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allMessagesTableView.register(UINib(nibName: K.AllMessages.cellNibName, bundle: nil), forCellReuseIdentifier: K.AllMessages.cellIdentifier)
        
        allMessagesTableView.delegate = self
        allMessagesTableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == K.AllMessages.segueIdentifier) {
            let chatVC = segue.destination as! ChatViewController
            
            if let safeSelectedRowIndex = selectedRowIndex {
                chatVC.navigationItem.title = chats[safeSelectedRowIndex].name
                chatVC.textMessages = chats[safeSelectedRowIndex].generateTextMessages(50)
            }
        }
    }

}

extension AllMessagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedRowIndex = indexPath.row
        self.performSegue(withIdentifier: K.AllMessages.segueIdentifier, sender: self)
    }
    
}

extension AllMessagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageCell = tableView.dequeueReusableCell(withIdentifier: K.AllMessages.cellIdentifier, for: indexPath) as! AllMessagesDetailCell
        
        messageCell.nameLabel.text = chats[indexPath.row].name
        messageCell.lastTextLabel.text = chats[indexPath.row].lastText
        messageCell.timeLabel.text = chats[indexPath.row].time
        messageCell.muteImageView.image = UIImage(systemName: chats[indexPath.row].muted ? K.SystemNames.muted : "")
        
        return messageCell
    }
    
}

