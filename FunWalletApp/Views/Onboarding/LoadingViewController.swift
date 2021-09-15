//
//  LoadingViewController.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/6/21.
//

import UIKit

class LoadingViewController: UIViewController {
    private let isUserLoggedIn = false

    override func viewDidLoad () {
        super.viewDidLoad ()
    }
    override func viewDidAppear (_ animated: Bool) {
        super.viewDidAppear(animated)
        delay (durationInSeconds: 2.0) {
            self.showInitialView()

        }

    }

    private func showInitialView (){
        //if user is logged in, => main tab bar controller
         //else show onboarding
        if isUserLoggedIn{
            PresenterManager.shared.show(vc: .mainTabBarController)
        } else {
            performSegue(withIdentifier: K.segue.showOnBoardingScreen, sender: nil)
        }
    }
}
