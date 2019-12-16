//
//  ChooseOperationVC.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/15/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class OperationsMenuVC: UIViewController {
    
    var controller: Controller!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cashWithdrawalTapped(_ sender: UIButton) {
        presentVC(identifier: "CashWithdrawalVC", controller: controller)
    }
    
    @IBAction func moneyTransferTapped(_ sender: UIButton) {
        presentVC(identifier: "MoneyTransferVC", controller: controller)
    }
    
    @IBAction func paymentForServicesTapped(_ sender: UIButton) {
        presentVC(identifier: "PaymentForServicesVC", controller: controller)
    }
    
    @IBAction func accountBalanceTapped(_ sender: UIButton) {
        view.isUserInteractionEnabled = false
        controller.getAccountBalance() {
            self.presentVC(identifier: "AccountBalanceVC", controller: self.controller)
        }
    }
    
    @IBAction func returnCardTapped(_ sender: UIButton) {
        presentVC(identifier: "AuthorizationVC", controller: controller)
    }
}
