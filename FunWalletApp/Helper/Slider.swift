//
//  Slider.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/15/21.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var lbl: UILabel!
    
    
    
    @IBAction func slider(_ sender: UISlider) {
        lbl.text = String(Int(sender.value))
    }
    override func viewDidLoad (){
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
