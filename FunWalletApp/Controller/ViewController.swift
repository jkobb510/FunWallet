//
//  ViewController.swift
//  FunWalletApp-Main
//
//  Created by Seung Min Lee on 8/19/21.
//

import UIKit

class ExploreController: UIViewController {

    @IBOutlet weak var circularImageView: CircularImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circularImageView.image=UIImage(named: "man")
        // Do any additional setup after loading the view.
    }

}

class WishListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class NotificationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
class ProfileController: UIViewController {

    
    @IBAction func ProfileButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showProfileInfo" , sender: nil)
    }
}




