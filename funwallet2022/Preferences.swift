//
//  Preferences.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/23/22.
//

import SwiftUI

struct Preferences: View {
    @State var Amount: String = ""
    @State var presentAlert = false

    var body: some View {
            
            VStack{
                Text("How much would you like to spend on each date?")
                TextField("Enter Amount", text: $Amount).padding(.all)  .background(.gray)
                    .cornerRadius(5.0)
            
                Button("Sign Up") {
                    signUp()
                }.padding([.top, .leading, .trailing])
                    .frame(height: 35.0)
                    .foregroundColor(.white)
                    .background(.yellow).border(.gray)
      
            
            
        }.padding([.leading, .bottom, .trailing])
    
            .sheet(isPresented: $presentAlert) {
              SelectLocation()
            }
        
    }
    
        func signUp() {
          self.presentAlert = true
            
        }
}


struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Preferences()
    }
}
