//
//  PaymentForServicesVC.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/16/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class PaymentForServicesVC: UIViewController {
    
    var controller: Controller!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func internetConnectionTapped(_ sender: UIButton) {
        presentVC(identifier: "InternetConnectionVC", controller: controller)
    }
    
    @IBAction func mobileConnectionTapped(_ sender: UIButton) {
        presentVC(identifier: "MobileConnectionVC", controller: controller)
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        presentVC(identifier: "OperationsMenuVC", controller: controller)
    }
}
