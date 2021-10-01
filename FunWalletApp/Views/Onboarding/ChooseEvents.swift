//
//  ChooseEvents.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/18/21.
//

import UIKit

class ChooseEvents: UIViewController {
    enum Segues {
        static let toFirstChild = "toFirstChild"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == Segues.toFirstChild {
            let destVC = segue.destination as! FirstChildVC
            
        }
    }

    
    @IBAction func Submit(_ sender: UIButton) {
        performSegue(withIdentifier: K.segue.showMain2, sender: nil)
    }
    
}
