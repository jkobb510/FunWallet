//
//  Onboarding.swift
//  funwallet2022
//
//  Created by Seung (Jacob) Lee on 1/21/22.
//

import SwiftUI



struct Onboarding_Previews : PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

struct Onboarding: View {
    @State fileprivate var isShowingSheet: Bool = false
    @State private var showThirdView = false

    @State var CurrentIndex : Int = 1
    var body: some View {
        VStack {
            ZStack{
            Image("LaunchIcon")
            .renderingMode(.none).resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.top, 7.0)
            .frame(alignment: .top)
            .frame(width: 50.0, height: 50.0)
            }
            
            TabView(selection: $CurrentIndex) {
                ForEach(1...3,id: \.self) {index in
                    //Custom Scroll Effect
                    GeometryReader{proxy -> AnyView in
                        let minX = proxy.frame(in: .global).minX
                        let width = UIScreen.main.bounds.width
                        let progress = -minX / (width * 2)
                        var scale = progress > 0 ? 1 - progress : 1 + progress
                            scale = scale < 0.5 ? 0.7 : scale
                         
                        return AnyView(
                            VStack{
                                Image("pic\(index)")
                                    .renderingMode(.none)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(alignment: .leading)
                                    .padding(.horizontal,2)
                                CustomeTabIndicator(count: 3, current: $CurrentIndex).padding(.all, 1.0)
                            }
                                .frame(maxHeight: .infinity, alignment: .center)
                            .scaleEffect(scale)
                        )
                    }
                    .tag(index)
                }
            }
            
        
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            //custom tab indicator
            
           getstarted()
            
        }//VStack
        .frame(maxWidth: .infinity)
        .background(Color.white).ignoresSafeArea()
        }
    
}
struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNext: Bool

    var body: some View {
        Button("Show the third view.") {
            self.presentationMode.wrappedValue.dismiss()
            DispatchQueue.main.async {
                self.showNext = true
            }
        }
    }
}
struct CustomeTabIndicator: View {
    var count: Int
    @Binding var current: Int
     
    var body: some View {
        HStack {
            HStack {
                ForEach(0..<count,id: \.self) { index in
                    ZStack {
                        //image  index start from 1..
                        if (current - 1) == index {
                            Circle()
                                .fill(Color.yellow)
                        }
                        else {
                            Circle()
                                .fill(Color.white)
                                .overlay(Circle()
                                        .stroke(Color.gray, lineWidth: 1.5)
                                )
                        }
                    }
                    .frame(width: 10, height: 10)
                }
            }
        }
    }
}

struct getstarted: View {
    @State fileprivate var isShowingSheet: Bool = false
    var body: some View {
        
              Button(action: {signUp()}){
              Text("Get Started")
               .font(.title3).fontWeight(.bold).foregroundColor(.white)
               .frame(maxWidth: 150, alignment: .center)
             
               .padding(.vertical,12.0).padding(.horizontal, 20.0)
                     .background(
                         RoundedRectangle(cornerRadius: 10)
                             .fill(Color.yellow)
                             .overlay(
                                 RoundedRectangle(cornerRadius: 10)
                                     .stroke(Color.black,lineWidth: 1)
                             ))
              }.padding([.leading, .bottom, .trailing], 40.0)
             .sheet(isPresented: $isShowingSheet, content: {
                 LoginView()
                   })
                  /* .background(
                                
                   NavigationLink(destination: Home(), isActive: $showThirdView) {
                                      EmptyView()
                                }
                          )*/
        }
    func signUp() { isShowingSheet = true }
}
