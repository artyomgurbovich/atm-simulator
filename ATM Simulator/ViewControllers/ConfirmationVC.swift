//
//  PINVC.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/15/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class ConfirmationVC: UIViewController {

    @IBOutlet weak var pinField: UITextField!
    
    var controller: Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        preparePinField()
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if let pin = Int(pinField.text ?? "") {
            view.isUserInteractionEnabled = false
            controller.requestSession(pin: pin) {
                self.presentVC(identifier: "OperationsMenuVC", controller: self.controller)
            }
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        presentVC(identifier: "AuthorizationVC", controller: controller)
    }
    
    func preparePinField() {
        pinField.inputAccessoryView = createToolBarWithButton(title: "Done", action: #selector(dismissKeyboard))
    }
}
