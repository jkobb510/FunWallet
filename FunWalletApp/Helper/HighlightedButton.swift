//
//  HighlightedButton.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/18/21.
//

import UIKit


class HighlightedButton: UIButton {
    
    var isHighLighted:Bool = false
    override func viewDidLoad() {

        let button  = UIButton(type: .system)

        button.setTitle("Your title", forState: UIControlState.Normal)
        button.frame = CGRectMake(0, 0, 100, 44)

        self.view.addSubview(button as UIView)
        //set normal image
        button.setImage(normalImage, forState: UIControlState.Normal)
        //set highlighted image
        button.setImage(selectedImage, forState: UIControlState.Selected)

        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)

    }

    func buttonClicked(sender:UIButton)
    {
          sender.selected = !sender.selected;
    }
