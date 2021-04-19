import SwiftUI

struct LogInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowForgetPasswordView: Bool = false
    @State private var showingAlert: Bool = false
    @State private var selection: Int? = nil
    
    fileprivate func LoginButton() -> some View {
        return NavigationLink(destination: Text("Destination View"), tag: 1, selection: $selection) {
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {
                    self.showingAlert = true
                    return
                }
                self.selection = 1
            }) {
                ButtonTextTypeOne(title: "Login")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error!"), message: Text("Please enter the data."), dismissButton: .default(Text("Got it!")))
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
