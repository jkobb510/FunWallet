//
//  LoginViewController.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/13/21.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginViewController: UIViewController{
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var otp: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        otp.isHidden = true
    }
    var verification_id : String? = nil
    
    
    @IBAction func Submit(_ sender: Any) {
        
        if (otp.isHidden) {
            if (!phoneNumber.text!.isEmpty) {
                
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber.text!, uiDelegate: nil, completion: {verificationID, error in
            
            if (error != nil) {
                print(error.debugDescription)
            }else{
                self.verification_id = verificationID
                self.otp.isHidden = false
                
            }
            
        })
            } else {
                print ("Please Enter Your Mobile Number")
            }
        }else{
                if (verification_id != nil) {
                    let credential = PhoneAuthProvider.provider().credential(withVerificationID: verification_id!, verificationCode: otp.text!)
                    Auth.auth().signIn(with: credential, completion: {authData, error in
                        if (error != nil){
                            print(error.debugDescription)
                        }else{
                            print("Authentication success with - " + (authData?.user.phoneNumber! ?? "No Phone Number"))
                            self.performSegue(withIdentifier: K.segue.showMain, sender: nil)

                        }
                })
        } else {
            print ("Error in getting verification ID")
              // Sign in using the verificationID and the code sent to the user
              // ...
          }

          
    }    }
}
