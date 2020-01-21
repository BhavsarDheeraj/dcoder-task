//
//  PopupViewController.swift
//  dcoder-task
//
//  Created by Dheeraj on 20/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

enum PopupType {
    case sort
    case filter
}

protocol PopupViewControllerDelegate: class {
    func didSelectItem()
}

class PopupViewController: UIViewController {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var dataTableView: UITableView!
    
    weak var delegate: PopupViewControllerDelegate?
    
    private let dataController = DataController.shared.codesController
    
    var type: PopupType = .sort
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapDoneButton(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.delegate?.didSelectItem()
        }
    }
    
}

extension PopupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
        case .sort:
            return dataController.sorts.count
        case .filter:
            return dataController.filters.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopupTableViewCell.identifier) as! PopupTableViewCell
        switch type {
        case .filter:
            cell.configure(with: dataController.filters[indexPath.row])
        case .sort:
            cell.configure(with: dataController.sorts[indexPath.row])
        }
        return cell
    }
    
}

extension PopupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch type {
        case .filter:
            selectFilter(at: indexPath.row)
        case .sort:
            selectSort(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
    func selectFilter(at position: Int) {
        for index in 0 ..< dataController.filters.count {
            if index == position {
                dataController.filters[index].isSelected = true
            } else {
                dataController.filters[index].isSelected = false
            }
        }
    }
    
    func selectSort(at position: Int) {
        for index in 0 ..< dataController.sorts.count {
            if index == position {
                dataController.sorts[index].isSelected = true
            } else {
                dataController.sorts[index].isSelected = false
            }
        }
    }
    
}
