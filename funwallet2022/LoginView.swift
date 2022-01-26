//
//  ContentView.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/21/22.
//

import SwiftUI



struct LoginView : View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {

        VStack {
            WelcomeText()
            UserImage().frame(width: 125.0, height: 125.0).padding(.bottom)
            Section{
            TextField("Username", text: $username)
                .padding(.all, 10.0)
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 3)
            SecureField("Password", text: $password)
                .padding(.all, 10.0)
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 10)
                
            }
            .padding(.horizontal, 55.0)
            NavigationLink(destination: Home()) {
               LoginButtonContent()
                
            }
            .padding(.all, 25.0)
            Section{
                NavigationLink(destination: SelectLocation(), label: {
        HStack (alignment: .center, spacing: 5.0){
           
            Image("google")
                .resizable()
            .renderingMode(.none)
            .aspectRatio(contentMode: .fit)
          
            .frame(width: 28, height: 20)
            Text("Login With Google")
                .font(.footnote)
                .fontWeight(.medium)
            .foregroundColor(Color.blue)
            .kerning(1)
   
        }
                    
                })
        
                    .padding(.all, 10.0)
                    .frame(maxWidth: 190)
                // Capsuled Border...
                    .background(
        Capsule().strokeBorder(Color(.gray)))
            }.padding(.bottom, 100)
                               
        }
            
        }
        }
        
}


#if DEBUG
struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif

struct WelcomeText : View {
    var body: some View {
        return Text("FunWallet")
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(Color.gray)
    }
}

struct UserImage : View {
    var body: some View {
        return Image("LaunchIcon")
            .renderingMode(.none)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding( .vertical, -5)
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("Sign In")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 100, height: 40)
            .background(Color.yellow)
            .cornerRadius(15.0)
    }
}
