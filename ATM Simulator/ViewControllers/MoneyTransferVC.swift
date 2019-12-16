//
//  MoneyTransferVC.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/16/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class MoneyTransferVC: UIViewController {

    @IBOutlet weak var receiverCardNumberField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    
    var controller: Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        prepareReceiverCardNumberField()
        prepareAmountField()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        if let receiverCardNumber = receiverCardNumberField.text, let amount = Double(amountField.text ?? "") {
            view.isUserInteractionEnabled = false
            controller.transferMoney(receiverCardNumber: receiverCardNumber, amount: amount) {
                self.presentVC(identifier: "ConfirmationVC", controller: self.controller)
            }
        }
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        presentVC(identifier: "OperationsMenuVC", controller: controller)
    }
    
    func prepareReceiverCardNumberField()  {
       receiverCardNumberField.inputAccessoryView = createToolBarWithButton(title: "Next", action: #selector(selectAmountField))
    }
    
    func prepareAmountField()  {
       amountField.inputAccessoryView = createToolBarWithButton(title: "Done", action: #selector(dismissKeyboard))
    }
    
    @objc func selectAmountField() {
        amountField.becomeFirstResponder()
    }
}
