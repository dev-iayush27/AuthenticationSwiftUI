import SwiftUI

struct LogInView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var isShowForgetPasswordView : Bool = false
    @State var selection: Int? = nil
    
    fileprivate func LoginButton() -> some View {
        return NavigationLink(destination: Text("Destination View"), tag: 1, selection: $selection) {
            Button(action: {
                self.selection = 1
            }) {
                ButtonTextTypeOne(title: "Login")
            }
        }
        .padding(.top, 40)
    }
    
    fileprivate func ForgetPasswordButton() -> some View {
        return Button(action: {
            self.isShowForgetPasswordView.toggle()
        }) {
            Text("Forget your password?")
                .foregroundColor(.gray)
                .padding()
        }.sheet(isPresented: $isShowForgetPasswordView) {
            ForgetPasswordView()
        }
    }
    
    fileprivate func GoogleLogInButton() -> some View {
        return Button(action: {
            
        }) {
            Image("google")
                .renderingMode(.original)
        }
    }
    
    fileprivate func FacebookLogInButton() -> some View {
        return Button(action: {
            
        }) {
            Image("facebook")
                .renderingMode(.original)
        }
    }
    
    var body: some View {
        ZStack {
            Color.init(hex: "F9F9F9")
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    CustomTextField(placeHolder: "Email", imageName: "envelope.fill", value: $email)
                    CustomTextField(placeHolder: "Password", imageName: "lock.fill", value: $password)
                }.padding(.top, 40)
                LoginButton()
                ForgetPasswordButton()
                Spacer()
                Text("Login with social account")
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                HStack {
                    GoogleLogInButton()
                    FacebookLogInButton()
                }
            }
            .padding([.leading, .trailing], 20)
        }
        .navigationBarTitle(Text("Login"), displayMode: .inline)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
