import SwiftUI

struct ForgetPasswordView: View {
    
    @State private var email : String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    fileprivate func SendButton() -> some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            ButtonTextTypeOne(title: "Send")
        }
        .padding(.top, 40)
    }
    
    var body: some View {
        ZStack {
            Color.init(hex: "F9F9F9")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Forget Password")
                    .fontWeight(.medium)
                    .padding([.top, .trailing, .leading], 20)
                Text("Please, enter your email address. You will receive a link to create a new password via email.")
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                    .lineLimit(nil)
                CustomTextField(placeHolder: "Email", imageName: "envelope.fill", value: $email)
                SendButton()
                Spacer()
            }
            .padding([.leading, .trailing], 20)
        }
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
