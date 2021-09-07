//
//  OnboardingCollectionViewCell.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/15/21.
//

import UIKit

class OnboardingCollectionViewCell:UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slides: OnBoardingSlide) {
        slideImageView.image = slides.image
        slideTitleLabel.text = slides.title
        slideDescriptionLabel.text = slides.description
    }
}

