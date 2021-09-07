//
//  SelectLocation.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/18/21.
//

import UIKit
import DropDown
import Firebase

class SelectLocation: UIViewController, UISearchBarDelegate{

    let dropDown = DropDown ()
    
    
    @IBOutlet weak var menuButton: UIButton!
    // The list of array to display. Can be changed dynamically


    @IBAction func dropButtonTapped(_ sender: UIButton) {
        dropDown.show()
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                self.menuButton.setTitle(item,for: .normal)
            }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    dropDown.anchorView = view
    dropDown.dataSource = ["San Francisco Bay Area, CA", "Greater Los Angeles, CA"]
        dropDown.layer.borderColor = UIColor.black.cgColor
        dropDown.layer.borderWidth = 1
           }
    
    @IBAction func NextBtn(_ sender: UIButton) {
        let db = Firestore.firestore()
        db.collection("users").addDocument(data:[ "Location": dropDown.selectedItem ?? ""] )
        performSegue(withIdentifier: K.segue.showPreferredSpendingScreen, sender: nil)
    }
}
    
    


    
    

