//
//  MobileConnectionVC.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/16/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class MobileConnectionVC: UIViewController {

    @IBOutlet weak var operatorNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    
    var controller: Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        prepareOperatorNameField()
        preparePhoneNumberField()
        prepareAmountField()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        if let operatorName = operatorNameField.text, let phoneNumber = phoneNumberField.text, let amount = Double(amountField.text ?? "") {
            view.isUserInteractionEnabled = false
            controller.payForMobileConnection(operatorName: operatorName, phoneNumber: phoneNumber, amount: amount) {
                self.presentVC(identifier: "ConfirmationVC", controller: self.controller)
            }
        }
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        presentVC(identifier: "OperationsMenuVC", controller: controller)
    }
    
    func prepareOperatorNameField()  {
       operatorNameField.inputAccessoryView = createToolBarWithButton(title: "Next", action: #selector(selectPhoneNumberFieldd))
    }
    
    func preparePhoneNumberField()  {
       phoneNumberField.inputAccessoryView = createToolBarWithButton(title: "Next", action: #selector(selectAmountField))
    }
    
    func prepareAmountField()  {
       amountField.inputAccessoryView = createToolBarWithButton(title: "Done", action: #selector(dismissKeyboard))
    }
    
    @objc func selectPhoneNumberFieldd() {
        phoneNumberField.becomeFirstResponder()
    }
    
    @objc func selectAmountField() {
        amountField.becomeFirstResponder()
    }
}
