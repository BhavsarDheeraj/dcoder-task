//
//  CodesViewController.swift
//  dcoder-task
//
//  Created by Dheeraj on 20/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

class CodesViewController: BaseViewController {
    
    private let dataController = DataController.shared.codesController
    
    @IBOutlet weak var codesTableView: UITableView!
    
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchCodes()
    }
    
    func setupViews() {
        sortButton.setTitle(dataController.sorts.filter({ $0.isSelected }).first?.title, for: .normal)
        filterButton.setTitle(dataController.filters.filter({ $0.isSelected }).first?.title, for: .normal)
    }
    
    func fetchCodes() {
        self.showActivityIndicatorOnWindow()
        dataController.getAllCodes(onSuccess: { [unowned self] in
            DispatchQueue.main.async {
                self.codesTableView.reloadData()
                self.dismissActivityIndicator()
            }
        }) { [unowned self] (message) in
            DispatchQueue.main.async {
                self.dismissActivityIndicator()
                self.showErrorDialog(message: message, actionTitle: "Retry") { [unowned self] action in
                    self.fetchCodes()
                }
            }
        }
    }
        
    @IBAction func didTapSortButton(_ sender: UIButton) {
        let popupVC = Storyboards.main.instantiateViewController(withIdentifier: PopupViewController.identifier) as! PopupViewController
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.type = .sort
        popupVC.delegate = self
        self.present(popupVC, animated: true, completion: nil)
    }
    
    @IBAction func didTapFilterButton(_ sender: UIButton) {
        let popupVC = Storyboards.main.instantiateViewController(withIdentifier: PopupViewController.identifier) as! PopupViewController
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.type = .filter
        popupVC.delegate = self
        self.present(popupVC, animated: true, completion: nil)
    }
}

//MARK:- TableView Data Source
extension CodesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataController.codes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.identifier) as! CodeTableViewCell
        cell.configure(with: dataController.codes[indexPath.row])
        return cell
    }
    
}

//MARK:- TableView Delegate
extension CodesViewController: PopupViewControllerDelegate {
    
    func didSelectItem() {
        self.setupViews()
    }
    
}
