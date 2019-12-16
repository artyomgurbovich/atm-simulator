//
//  AccountBalanceVC.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/16/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class AccountBalanceVC: UIViewController {

    @IBOutlet weak var balanceLabel: UILabel!
    
    var controller: Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        balanceLabel.text = String(controller.card.account.balance) + " USD"
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        presentVC(identifier: "ConfirmationVC", controller: controller)
    }
}
