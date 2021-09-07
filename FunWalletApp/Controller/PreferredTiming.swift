//
//  PreferredTiming.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/17/21.
//

import UIKit
import Firebase

class PreferredTiming: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.backgroundColor = UIColor.systemGray4
        button2.backgroundColor = UIColor.systemGray4
        button3.backgroundColor = UIColor.systemGray4
    }

    @IBAction func button1Tapped(_ sender: UIButton) {
        if button1.backgroundColor == UIColor.systemGray4 {
            button1.backgroundColor = UIColor.systemIndigo
        }
        else if button1.backgroundColor == UIColor.systemIndigo {
            button1.backgroundColor = UIColor.systemGray4
        }
    }
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        if button2.backgroundColor == UIColor.systemGray4 {
            button2.backgroundColor = UIColor.systemIndigo
        }
        else if button2.backgroundColor == UIColor.systemIndigo {
            button2.backgroundColor = UIColor.systemGray4
        }
    }
    
    @IBAction func button3Tapped(_ sender: UIButton) {
        if button3.backgroundColor == UIColor.systemGray4 {
            button3.backgroundColor = UIColor.systemIndigo
        }
        else if button3.backgroundColor == UIColor.systemIndigo {
            button3.backgroundColor = UIColor.systemGray4
        }
    }
    
    
    
    
    
    
    @IBAction func Next(_ sender: UIButton) {
        
        performSegue(withIdentifier: K.segue.showChoose, sender: nil)
    }
}
