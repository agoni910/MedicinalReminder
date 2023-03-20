//
//  Extensions.swift
//  MedicinalReminder
//
//  Created by Jwr on 2023/3/20.
//

import UIKit

extension UIView {
    @IBInspectable
    var radius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
