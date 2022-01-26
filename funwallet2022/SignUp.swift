//
//  ContentView.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/22/22.
//

import SwiftUI

struct SignUp: View {
    @ObservedObject private var userViewModel = UserViewModel()
    @State var presentAlert = false
    
    var body: some View {

        VStack {
            UserImage()
                .frame(width: 105.0, height: 105.0)
            Text("Create an Account")
                .font(.title)
                
                .fontWeight(.regular)
                .padding(.bottom, 15.0)
                .frame(maxWidth: .infinity).multilineTextAlignment(.center)
        
            Section(footer: Text(userViewModel.usernameMessage).font(.footnote).fontWeight(.regular).foregroundColor(.red).lineLimit(2)) {
                TextField("Username", text: $userViewModel.username).padding(.all, 7.0).background(Color(hue: 1.0, saturation: 0.05, brightness: 0.030, opacity: 0.05))
            .autocapitalization(.none)
        }
            .padding(.horizontal, 15.0)
            Section(footer: Text(userViewModel.passwordMessage).font(.footnote).fontWeight(.regular).foregroundColor(.red).multilineTextAlignment(.center)) {
                SecureField("Password", text: $userViewModel.password)                .padding(.all, 7.0    ).background(Color(hue: 1.0, saturation: 0.05, brightness: 0.030, opacity: 0.05))

                SecureField("Confirm Password", text: $userViewModel.passwordAgain).padding(.all, 7.0).background(Color(hue: 1.0, saturation: 0.05, brightness: 0.030, opacity: 0.05))
            }            .padding(.horizontal, 16.0)

            
            Section{
            Button("Sign Up") {
                signUp()
            }
            .padding(.horizontal)
            .frame(height: 35.0)
            .foregroundColor(.white)
            .background(.yellow).border(.gray)
            }
            .padding(.vertical,
                        10.0)

            
                    
            VStack{
                    Text("Or sign up with Google")
                        .font(.footnote)
                        .padding(.top, 6.0)
                        .foregroundColor(Color.gray)
                        .frame(height: 22.0)
                        Button {
                            
                        } label: {
                    HStack (alignment: .center, spacing: 10.0){
                        Image("google")
                            .resizable()
                        .renderingMode(.none)
                        .aspectRatio(contentMode: .fit)
                      
                        .frame(width: 23, height: 20)
                        Text("Create Account")
                            .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color.blue)
                        .kerning(1)
                    }
                    .padding(.all, 5.0)
                        .frame(maxWidth: 190)
                        // Capsuled Border...
                        .background(
                    Capsule().strokeBorder(Color(.gray)))
                    }
                        .padding([.leading, .bottom, .trailing], 20.0)
                    }
                
                Text(getAttributedString(string:"By creating an account, you are agreeing to our Terms of Service"))
                .font(.footnote)
            .fontWeight(.regular)
            .foregroundColor(.gray)
            .kerning(1.1)
            .lineSpacing (3)
                            .multilineTextAlignment(.center)
                
            
        }
      
        .padding(.horizontal, 30.0)
        .onAppear { // ADD THESE AFTER YOUR FORM VIEW
          UITableView.appearance().backgroundColor = .clear

      } .onDisappear { // CHANGE BACK TO SYSTEM's DEFAULT
          UITableView.appearance().backgroundColor = .systemGroupedBackground
      }
      .background(Color.white)
      .sheet(isPresented: $presentAlert) {
        Preferences()
      }
    }
    
    func signUp() {
      self.presentAlert = true
        
    }
  }

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
struct WelcomeView: View {
  var body: some View {
    Text("Welcome! Great to have you on board!")
  }
}



func getAttributedString(string:
String)->AttributedString{
var attributedString = AttributedString(string)

if let range = attributedString.range(of: "Terms of Service") {
attributedString[range].foregroundColor = .yellow
attributedString[range].font = .footnote.bold()
}
return attributedString
}
