//
//  ChatsViewController.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

class ChatsViewController: BaseViewController {
    
    private let dataController = DataController.shared.chatController

    @IBOutlet weak var chatsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchChats()
    }

    //MARK:- Fetch All Chats
    func fetchChats() {
        self.showActivityIndicatorOnWindow()
        dataController.getAllChatMessages(onSuccess: { [unowned self] in
            DispatchQueue.main.async {
                self.chatsTableView.reloadData()
                self.dismissActivityIndicator()
            }
        }) { [unowned self] (message) in
            DispatchQueue.main.async {
                self.dismissActivityIndicator()
                self.showErrorDialog(message: message, actionTitle: "Retry") { [unowned self] action in
                    self.fetchChats()
                }
            }
        }
    }
    
}

//MARK:- TableView Data Source
extension ChatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataController.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier) as! ChatTableViewCell
        let chat = dataController.chats[indexPath.row]
        cell.configure(with: chat)
        return cell
    }
    
}

//MARK:- TableView Delegate
extension ChatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataController.selectedChat = dataController.chats[indexPath.row]
        let messagesVC = Storyboards.main.instantiateViewController(withIdentifier: MessagesViewController.identifier) as! MessagesViewController
        self.navigationController?.pushViewController(messagesVC, animated: true)
    }
    
}



