//
//  Controller.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/15/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Controller {
    
    var card: Card
    var token: String
    
    init() {
        card = Card()
        token = String()
    }
    
    func requestSession(pin: Int, completion: (() -> Void)?) {
        let parameters: Parameters = ["cardNumber": card.number, "pin": pin]
        request("https://atm-simulator.free.beeceptor.com/requestToken", method: .post, parameters: parameters).responseJSON { response in
            let json = JSON(response.result.value!)
            self.token = json["token"].stringValue
            completion?()
        }
    }
    
    func withdrawCash(amount: Double, completion: (() -> Void)?) {
        let parameters: Parameters = ["token": token, "amount": amount]
        request("https://atm-simulator.free.beeceptor.com/withdrawCash", method: .post, parameters: parameters).responseJSON { response in
            completion?()
        }
    }
    
    func transferMoney(receiverCardNumber: String, amount: Double, completion: (() -> Void)?) {
        let parameters: Parameters = ["token": token, "receiverCardNumber": receiverCardNumber, "amount": amount]
        request("https://atm-simulator.free.beeceptor.com/transferMoney", method: .post, parameters: parameters).responseJSON { response in
            completion?()
        }
    }
    
    func payForInternetConnection(providerName: String, accountNumber: String, amount: Double, completion: (() -> Void)?) {
        let parameters: Parameters = ["token": token, "providerName": providerName, "accountNumber": accountNumber,  "amount": amount]
        request("https://atm-simulator.free.beeceptor.com/payForInternetConnection", method: .post, parameters: parameters).responseJSON { response in
            completion?()
        }
    }
    
    func payForMobileConnection(operatorName: String, phoneNumber: String, amount: Double, completion: (() -> Void)?) {
        let parameters: Parameters = ["token": token, "operatorName": operatorName, "phoneNumber": phoneNumber,  "amount": amount]
        request("https://atm-simulator.free.beeceptor.com/payForMobileConnection", method: .post, parameters: parameters).responseJSON { response in
            completion?()
        }
    }
    
    func getAccountBalance(completion: (() -> Void)?) {
        let parameters: Parameters = ["token": token]
        request("https://atm-simulator.free.beeceptor.com/getAccountBalance", method: .get, parameters: parameters).responseJSON { response in
            let json = JSON(response.result.value!)
            self.card.account.balance = json["accountBalance"].doubleValue
            completion?()
        }
    }
}
