//
//  ChooseEvents.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/18/21.
//

import UIKit

class ChooseEvents: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        performSegue(withIdentifier: K.segue.showMain2, sender: nil)
    }
    
}
