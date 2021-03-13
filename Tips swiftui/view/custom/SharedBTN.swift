//
//  SharedBTN.swift
//  Third login signup
//
//  Created by hosam on 1/21/21.
//

import SwiftUI

struct SharedBTN: ViewModifier {
    
   var text:String
    
    func body(content: Content) -> some View {
        
        Text(text)
            .font(.system(size: 20))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 50)
            .background(
                
                LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(8)
    }
}
