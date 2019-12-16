//
//  UIButtonExtension.swift
//  ATM Simulator
//
//  Created by Artyom Gurbovich on 12/15/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

extension UIButton {
    
    override open func awakeFromNib() {
        updateLayerProperties()
    }

    func updateLayerProperties() {
        let components = self.backgroundColor?.cgColor.components
        self.layer.shadowColor = UIColor(red: components![0], green: components![1], blue: components![2], alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20.0
    }
}
