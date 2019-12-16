//
//  CashWithdrawalVC.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/16/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class CashWithdrawalVC: UIViewController {

    @IBOutlet weak var amountField: UITextField!
    
    var controller: Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        prepareAmountField()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        if let amount = Double(amountField.text ?? "") {
            view.isUserInteractionEnabled = false
            controller.withdrawCash(amount: amount) {
                self.presentVC(identifier: "ConfirmationVC", controller: self.controller)
            }
        }
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        presentVC(identifier: "OperationsMenuVC", controller: controller)
    }
    
    func prepareAmountField()  {
       amountField.inputAccessoryView = createToolBarWithButton(title: "Done", action: #selector(dismissKeyboard))
    }
}
