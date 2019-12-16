//
//  ViewController.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/11/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class AuthorizationVC: UIViewController {

    @IBOutlet weak var cardNumberField: UITextField!
    
    var controller: Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        prepareCardNumberField()
        controller = Controller()
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if let cardNumber = cardNumberField.text {
            controller.card.number = cardNumber
            presentVC(identifier: "ConfirmationVC", controller: controller)
        }
    }
    
    func prepareCardNumberField() {
        cardNumberField.inputAccessoryView = createToolBarWithButton(title: "Done", action: #selector(dismissKeyboard))
    }
}

