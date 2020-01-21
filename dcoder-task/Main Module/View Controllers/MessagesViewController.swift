//
//  MessagesViewController.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

class MessagesViewController: BaseViewController {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    private let dataController = DataController.shared.chatController
    
    @IBOutlet weak var messagesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        scrollToBottom()
    }
    
    func setupNavBar() {
        self.title = dataController.selectedChat?.title
    }
    
    func scrollToBottom() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: (self.dataController.selectedChat?.messages.count ?? 0) - 1, section: 0)
            self.messagesTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }

}

//MARK:- TableView Data Source
extension MessagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataController.selectedChat?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        guard let message = dataController.selectedChat?.messages[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier) as! MessageTableViewCell
        cell.configure(with: message)
        return cell
    }
    
}
