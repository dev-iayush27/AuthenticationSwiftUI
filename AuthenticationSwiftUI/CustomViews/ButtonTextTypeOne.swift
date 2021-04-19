//
//  ButtonTextTypeOne.swift
//  AuthenticationSwiftUI
//
//  Created by M_AMBIN03921 on 19/04/21.
//

import SwiftUI

struct ButtonTextTypeOne: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(height: 45)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "cb2d3e"), Color.init(hex: "ef473a")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(25)
    }
}

struct ButtonTextTypeOne_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTextTypeOne(title: "Button Title")
    }
}
