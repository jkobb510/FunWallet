import SwiftUI
import GoogleSignIn


struct Onboarding_Previews : PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

struct Onboarding: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    // 2
    private let user = GIDSignIn.sharedInstance.currentUser

    @State var CurrentIndex : Int = 1
    var body: some View {
        NavigationView{
            VStack {

            Image_And_Button()

                VStack{ //Button
                    NavigationLink(destination: LoginView()){
                        
                    Text("Get Started")
                            .font(.title3).fontWeight(.bold).foregroundColor(.white).frame(maxWidth: 150, alignment: .center).padding(.vertical,12.0).padding(.horizontal, 20.0).background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow)
                               .overlay(RoundedRectangle(cornerRadius: 10) .stroke(Color.black,lineWidth: 1)
                               ))}.padding([.leading, .bottom, .trailing], 40.0)
                    
                    
                  
                
  
                }
                
                
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar { ToolbarItem(placement: .principal) {
                        HStack {
                            Image("LaunchIcon").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).frame(width: 50.0, height: 50.0)
                            Text("FunWallet").font(.headline).foregroundColor(Color.yellow)
                        }.padding(.bottom, 10)
                    }
                }
        .frame(maxHeight: .infinity)
        .background(Color(red: 239.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, opacity: 1.0)).ignoresSafeArea()
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


struct Image_And_Button: View {
    @State var CurrentIndex : Int = 1
var body: some View{
    TabView(selection: $CurrentIndex) {
        ForEach(1...3,id: \.self) {index in
            //Custom Scroll Effect
            GeometryReader {proxy -> AnyView in
                let minX = proxy.frame(in: .global).minX
                let width = UIScreen.main.bounds.width
                let progress = -minX / (width * 2)
                var scale = progress > 0 ? 1 - progress : 1 + progress
                scale = scale < 1.0 ? 1.0 : scale
                 
                return AnyView(
                        //Image("")
                        VStack{
   
                        Image("pic\(index)")
                            .renderingMode(.none)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.top, 10.0)
                            
                        }

                        .frame(maxHeight: .infinity, alignment: .top)
                    .scaleEffect(scale)
                )
            }//)
            .tag(index)
        }
    }
    
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    //custom tab indicator


    CustomeTabIndicator(count: 3, current: $CurrentIndex)
    Text("Turn dating into an adventure. Discover hosted events near you")
        .font(.title2)
        .fontWeight(.regular)
        .foregroundColor(Color.black).padding()
}

}

