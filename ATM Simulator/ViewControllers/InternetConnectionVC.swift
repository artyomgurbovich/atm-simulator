//
//  InternetConnectionVC.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/16/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class InternetConnectionVC: UIViewController {

    @IBOutlet weak var providerNameField: UITextField!
    @IBOutlet weak var accountNumberField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    
    var controller: Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        prepareProviderNameField()
        prepareAccountNumberField()
        prepareAmountField()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        if let providerName = providerNameField.text, let accountNumber = accountNumberField.text, let amount = Double(amountField.text ?? "") {
            view.isUserInteractionEnabled = false
            controller.payForInternetConnection(providerName: providerName, accountNumber: accountNumber, amount: amount) {
                self.presentVC(identifier: "ConfirmationVC", controller: self.controller)
            }
        }
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        presentVC(identifier: "OperationsMenuVC", controller: controller)
    }
    
    func prepareProviderNameField()  {
       providerNameField.inputAccessoryView = createToolBarWithButton(title: "Next", action: #selector(selectAccountNumberField))
    }
    
    func prepareAccountNumberField()  {
       accountNumberField.inputAccessoryView = createToolBarWithButton(title: "Next", action: #selector(selectAmountField))
    }
    
    func prepareAmountField()  {
       amountField.inputAccessoryView = createToolBarWithButton(title: "Done", action: #selector(dismissKeyboard))
    }
    
    @objc func selectAccountNumberField() {
        accountNumberField.becomeFirstResponder()
    }
    
    @objc func selectAmountField() {
        amountField.becomeFirstResponder()
    }
}
