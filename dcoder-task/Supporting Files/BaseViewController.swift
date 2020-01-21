//
//  BaseViewController.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let spinnerVC = SpinnerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Show Activity Indicator on Window
    func showActivityIndicatorOnWindow(with message: String? = nil) {
        let keyWindow = UIApplication.shared.windows.first
        spinnerVC.view.translatesAutoresizingMaskIntoConstraints = true
        addChild(spinnerVC)
        spinnerVC.view.frame = keyWindow!.frame
        view.addSubview(spinnerVC.view)
        spinnerVC.didMove(toParent: self)
    }
    
    //MARK: Dismiss Activity Indicator
    func dismissActivityIndicator() {
        spinnerVC.willMove(toParent: nil)
        spinnerVC.view.removeFromSuperview()
        spinnerVC.removeFromParent()
    }
    
    //MARK: Show Error Dialog
    func showErrorDialog(message: String?, actionTitle: String, completion:((UIAlertAction) -> Void)?) {
        let dialog = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: actionTitle, style: .default, handler: completion))
        
        dialog.setBackgroundColor(color: Colors.secondaryColor.value)
        dialog.setTitleColor(color: .white)
        dialog.setMessageColor(color: .white)
        dialog.setTint(color: .white)
        
        self.present(dialog, animated: true, completion: nil)
    }

}

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = Colors.primaryColor.value

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.color = .white
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
