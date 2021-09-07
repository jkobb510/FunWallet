//
//  SettingsViewController.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/10/21.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad () {
        super.viewDidLoad()
        setupViews()
    }
    private func setupViews (){
        view.backgroundColor = .gray
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem){
        PresenterManager.shared.show(vc: .onboarding)
        }

    }



