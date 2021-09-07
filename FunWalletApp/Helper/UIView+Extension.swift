//
//  UIView+Extension.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/14/21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius
            }
        set {
            self.layer.cornerRadius = newValue
        }
            
        }
}
