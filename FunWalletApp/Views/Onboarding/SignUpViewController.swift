//
//  SignUpViewController.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/16/21.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otp.isHidden = true

    }
    var verification_id : String? = nil

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    func setUpElements() {
    
        // Hide the error label
    
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(phoneNumberTextField)
        Utilities.styleTextField(otp)
        Utilities.styleFilledButton(NextButton)
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    @IBOutlet weak var otp: UITextField!
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        


        
        return nil
    }

    @IBAction func NextButton(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            print(error.debugDescription)
        }
        else {
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneNumber = phoneNumberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  
            
            if (otp.isHidden==true) {
                    Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil, completion: {verificationID, error in
                
                        if (error != nil) {
                    print(error.debugDescription)
                        }
                        else{
                    
                            self.verification_id = verificationID
                            self.otp.isHidden = false
                }
                
            })
                
            }else{
                    if (verification_id != nil) {
                        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verification_id!, verificationCode: otp.text!)
                        Auth.auth().signIn(with: credential, completion: {authData, error in
                            if (error != nil){
                                print(error.debugDescription)
                            }else{
                                print("Authentication success with - " + (authData?.user.phoneNumber! ?? "No Phone Number"))
                                let db = Firestore.firestore()
                                db.collection("users").addDocument(data: ["first_name":firstName, "last_name":lastName, "uid": authData!.user.uid ]) { (error) in
                                    
                                    if error != nil {
                                        // Show error message
                                        print("Error saving user data")
                                    }
                                }
                                self.performSegue(withIdentifier: K.segue.showSelectLocationScreen, sender: nil)
                                }

                                
                        })
                        }
                
             else {
                print ("Error in getting verification ID")
                  // Sign in using the verificationID and the code sent to the user
                  // ...
              }

              
        }    }
            
        }
    
}
