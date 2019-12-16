//
//  UIViewControllerExtension.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/16/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    func createToolBarWithButton(title: String, action: Selector?) -> UIToolbar {
        let toolBar = UIToolbar()
        let doneButton = UIBarButtonItem(title: title, style: .done, target: self, action: action)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        toolBar.sizeToFit()
        return toolBar
    }
    
    func presentVC(identifier: String, controller: Controller) {
        switch identifier {
        case "AuthorizationVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! AuthorizationVC
            viewController.controller = controller
            presentFullScreen(viewController)
        case "ConfirmationVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! ConfirmationVC
            viewController.controller = controller
            presentFullScreen(viewController)
        case "OperationsMenuVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! OperationsMenuVC
            viewController.controller = controller
            presentFullScreen(viewController)
        case "CashWithdrawalVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! CashWithdrawalVC
            viewController.controller = controller
            presentFullScreen(viewController)
        case "MoneyTransferVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! MoneyTransferVC
            viewController.controller = controller
            presentFullScreen(viewController)
        case "PaymentForServicesVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! PaymentForServicesVC
            viewController.controller = controller
            presentFullScreen(viewController)
        case "InternetConnectionVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! InternetConnectionVC
            viewController.controller = controller
            presentFullScreen(viewController)
        case "MobileConnectionVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! MobileConnectionVC
            viewController.controller = controller
            presentFullScreen(viewController)
        case "AccountBalanceVC":
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: identifier) as! AccountBalanceVC
            viewController.controller = controller
            presentFullScreen(viewController)
        default:
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: "AuthorizationVC") as! AuthorizationVC
            viewController.controller = controller
            presentFullScreen(viewController)
        }
    }
    
    func presentFullScreen(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: false, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
