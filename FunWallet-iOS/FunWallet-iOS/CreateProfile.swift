//
//  ContentView.swift
//  FunWallet-iOS
//
//  Created by Seung (Jacob) Lee on 1/31/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
struct CreateProfile: View {
    @State private var isActive = false
    @State var shouldShowImagePicker = false
    @State var image: UIImage?

    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var phone: String = ""

    @State var age: String = ""
    var body: some View {
        NavigationView{
        ZStack{
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)

            VStack (spacing: 20){
                Text("Create Profile")
                    .font(.title)
                Button {
                    shouldShowImagePicker.toggle()

                 } label: {
                     Image(systemName: "person.crop.circle")
                         .foregroundColor(Color.blue)
                         .font(.system(size: 104))
                         
                 }
                Text("Add Profile Pic").foregroundColor(Color.blue).padding(.top, -20).padding(.bottom)
                HStack{
            TextField("First Name", text:  $firstname).padding(.all, 12).background(.white)
            
            TextField("Last Name", text:  $lastname)
                    .padding(.all, 12).background(.white)
                }
                TextField("Phone Number", text: $phone).padding(.all, 12).background(.white)  .padding(.horizontal, 70).padding()
               
                    
                    
               
                NavigationLink(destination: Preferences(), isActive: $isActive) {
                    Button {
                        if (firstname.isBlankOrEmpty() && lastname.isBlankOrEmpty() && phone.isBlankOrEmpty()){
                            self.persistImageToStorage()
                        
                            
                            // then set
                            isActive = true
                        }
                        } label: {
                    Text("Next").fontWeight(.semibold).foregroundColor(.white).frame(maxWidth: 90, minHeight: 40)
                }.background(.yellow)
            }
            }
            .padding()
        }        .navigationViewStyle(StackNavigationViewStyle())
                .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                    ImagePicker(image: $image)
                       
        
        
    }.edgesIgnoringSafeArea(.all)
    
    }
    }
    @State var StatusMessage = ""
    private func persistImageToStorage() {
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            let ref = FirebaseManager.shared.storage.reference(withPath: uid)
            guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
            ref.putData(imageData, metadata: nil) { metadata, err in
                if let err = err {
                    self.StatusMessage = "Failed to push image to Storage: \(err)"
                    return
                }

                ref.downloadURL { url, err in
                    if let err = err {
                        self.StatusMessage = "Failed to retrieve downloadURL: \(err)"
                        return
                    }

                    self.StatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                    print(url?.absoluteString as Any)
                    guard let url = url else { return }
                    self.storeUserInformation(imageProfileUrl: url)
                }
            }
        }
    private func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["profileImageUrl": imageProfileUrl.absoluteString,"first": self.firstname, "lastname": self.lastname, "phone": self.phone]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.StatusMessage = "\(err)"
                    return
                }

                print("Success")
            }
    }


}

struct CreateProfile_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfile()
    }
}

extension String {
    func isBlankOrEmpty() -> Bool {

      // Check empty string
      if self.isEmpty {
          return true
      }
      // Trim and check empty string
      return (self.trimmingCharacters(in: .whitespaces) == "")
   }
}
