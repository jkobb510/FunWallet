//
//  CircularImageView.swift
//  FunWalletApp-Main
//
//  Created by Seung Min Lee on 8/19/21.
//

import UIKit

@IBDesignable

class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}
