//
//  SelectLocation.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/18/21.
//

import UIKit
import SwiftUI
import Firebase

class SelectLocation: UIViewController{


    
    override func viewDidLoad() {
        
        super.viewDidLoad()
           }


    
    @IBSegueAction func renderSearchView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView())
    }
    

    
    
    @IBAction func NextBtn(_ sender: UIButton) {
        performSegue(withIdentifier: K.segue.showPreferredSpendingScreen, sender: nil)
    }
}
    
    


    
    

