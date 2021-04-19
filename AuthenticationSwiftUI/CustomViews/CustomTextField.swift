import SwiftUI

struct CustomTextField: View {
    
    var placeHolder: String
    var imageName: String
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
                .foregroundColor(Color.init(hex: "DB3022"))
            if placeHolder == "Password" {
                SecureField(placeHolder, text: $value)
                    .padding(.leading, 12)
                    .font(.system(size: 20))
                    .frame(height: 45)
            } else {
                TextField(placeHolder, text: $value)
                    .padding(.leading, 12)
                    .font(.system(size: 20))
                    .frame(height: 45)
            }
        }
        .background(Color.white)
        .cornerRadius(25)
        .padding(.top, 10)
        .shadow(color: .gray, radius: 0.5)
    }
}
