import SwiftUI

struct SignupView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var selection: Int? = nil
    @State private var showingAlert: Bool = false
    
    fileprivate func SignUpButton() -> some View {
        return NavigationLink(destination: Text("Destination View"), tag: 1, selection: $selection) {
            Button(action: {
                guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
                    self.showingAlert = true
                    return
                }
                self.selection = 1
            }) {
                ButtonTextTypeOne(title: "Sign Up")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error!"), message: Text("Please enter the data."), dismissButton: .default(Text("Got it!")))
            }
        }
        .padding(.top, 40)
    }
    
    fileprivate func GoToLoginButton() -> some View {
        return NavigationLink(destination: LogInView(), tag: 2, selection: $selection) {
            Button(action: {
                self.selection = 2
            }) {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                    .padding()
            }
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
        NavigationView {
            ZStack {
                Color.init(hex: "F9F9F9")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        CustomTextField(placeHolder: "Name", imageName: "person.fill", value: $name)
                        CustomTextField(placeHolder: "Email", imageName: "envelope.fill", value: $email)
                        CustomTextField(placeHolder: "Password", imageName: "lock.fill", value: $password)
                    }.padding(.top, 40)
                    SignUpButton()
                    GoToLoginButton()
                    Spacer()
                    Text("Signup with social account")
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    HStack {
                        GoogleLogInButton()
                        FacebookLogInButton()
                    }
                }
                .padding([.leading, .trailing], 20)
            }
            .navigationBarTitle(Text("Signup"), displayMode: .inline)
        }
        .accentColor(Color(.label))
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
