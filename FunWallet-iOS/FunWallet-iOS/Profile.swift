

import SwiftUI


struct Profile: View {
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var description: String = ""
    @State var interests: String = ""
    @State var gender: String = ""
    @State var age = 0
    @State var location: String = ""
    @State var willingtospend = 0
    @State private var pushnotifications = false
    var body: some View {
        NavigationView {
        ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        Text("Profile")
                                            
                            .font(Font.system(.largeTitle, design: .default).weight(.semibold))     .frame(maxWidth: .infinity, alignment: .leading)
                        VStack {
                                        
                            Circle()
                                                
                                
                    .stroke(Color.primary, lineWidth: 0)
                    .background(Circle().fill(Color.gray))
                    .frame(minWidth: 150, minHeight: 150)
                              .padding(.vertical, 2)
                            Text("Name:")
                            TextField("First Name", text: $firstname)
                        }
                            VStack(alignment: .leading) {
                                HStack {
                                                     
                                    Text("Email")
                                    TextField("Email Address:", text: $email)
                                                    
                                }
                                HStack {
                                                     
                                    Text("Phone")
                                    TextField("Phone Number:", text: $phone)
                                                    
                                    Spacer()
                                }
                                            
                                HStack {
                                          
                                    Text("Description: ")
                                    TextField("Tell Others About Yourself", text: $description).foregroundColor(.gray)
                                }
                                          
                                HStack {
                                          
                                    Text("Interests: ")
                                    TextField("Interests", text: $interests)
                                    Spacer()
                                }
                                          
                                .padding(.vertical, 2)
                                         
                                HStack {
                                       
                                    
                                    Text("Gender:")
                                    TextField("Gender", text: $gender)
                                    Spacer()
                                }
                               HStack {
                                                    
                                   Text("Age:")
                                   TextField("Age:", value: $age, format:.number)
                                                   .keyboardType(.numberPad)
                                   Spacer()
                               }
                                                
                               .padding(.vertical, 2)
                            HStack {
                                                   
                                Text("Location:")
                                Spacer()
                                                }
                                                
                                HStack {
                                                    
                                    Text("Willing to Spend:")
                                    TextField("Amount", value: $willingtospend, format:.number)
                                                    .keyboardType(.numberPad)
                                    Spacer()
                                }
                          
                                .padding(.vertical, 2)
                                                
                                HStack(alignment: .firstTextBaseline) {
                                             
                                    VStack {
                                                Toggle("Push Notifications:", isOn: $pushnotifications)

                                                if pushnotifications {
                                                    Text("Push Notifications On")
                                                }
                                            }
                                    Spacer()
                                                
                                }
                                               
                                
                                Text("Log Out")
                                                  
                            .frame(maxWidth: .infinity)
                                                    
                                                    
                            .padding()
                            
                            .foregroundColor(Color.red)
                            
                            }
                            
                            .padding(.all)
                            
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            .clipped()
                                        
                        }
                                    
                    }
        
                    .frame(maxWidth: .infinity)
        }
                                
        }
        
    }
