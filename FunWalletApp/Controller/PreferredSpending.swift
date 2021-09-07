//
//  PreferredSpending.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/18/21.
//

import UIKit
import Firebase
class PreferredSpending: UIViewController {
    var low: Int = 0
    var high: Int = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var Lowprice: UITextField!
    
    @IBOutlet weak var Highprice: UITextField!
    
    @IBAction func NextButton(_ sender: UIButton) {
        let str = Lowprice.text!
        let str2 = Highprice.text!
        let db = Firestore.firestore ()
        db.collection("users").addDocument(data:[ "SpendingLow": str, "SpendingHigh": str2 ] )
        performSegue(withIdentifier: K.segue.showPreferredTimingScreen, sender: nil)
    }
}
