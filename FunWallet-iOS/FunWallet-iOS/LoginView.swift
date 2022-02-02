//
//  LoginView.swift
//  FunWallet-iOS
//
//  Created by Seung (Jacob) Lee on 1/31/22.
//
import Firebase
import SwiftUI


struct LoginView: View {
    @State private var isPresented = false
    @State private var create = false
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var confirmpassword = ""
    var body: some View {
        NavigationView {
            ZStack{
                colorgradient()

            
                VStack(spacing: 20) {
                    Image("icon").padding(.vertical, -50)

                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle()).padding()
                    
             

                
                                                    
                                                
                    Group {
                        if isLoginMode {

                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                        
                    }
                        else{
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            SecureField("Password", text: $password)
                            SecureField("Confirm Password", text: $confirmpassword)
                        }
                    }
                    .padding(.all, 12)
                    .background(Color.white)
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            
                            Text(isLoginMode ? "Log In" : "Create Account").cornerRadius(5)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.yellow)

                    }
                }
                .padding(25)
            }
            
            .navigationTitle("Sign-In")
            
            
            .fullScreenCover(isPresented: $isPresented, content: HomeView.init)
            .fullScreenCover(isPresented: $create, content: CreateProfile.init)
         
            .edgesIgnoringSafeArea(.all)
        
    
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            loginUser()
        }
        else {
            if password==confirmpassword {
            
            createNewAccount()
            }else{
                print ("Please make sure your passwords match")
            
        }
    }
    }
    @State var loginStatusMessage = ""

    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }

            print("Successfully logged in as user: \(result?.user.uid ?? "")")

            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            isPresented.toggle()
            
        }
        

    }
   
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                create.toggle()
                return
            }

            print("Successfully created user: \(result?.user.uid ?? "")")

            self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
            
            
        }
    
}
    private func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["email": self.email, "uid": uid]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.loginStatusMessage = "\(err)"
                    return
                }

                print("Success")
            }
    }
}
struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
        
    }
    
}
    
