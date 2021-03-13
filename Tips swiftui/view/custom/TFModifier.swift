//
//  TFModifier.swift
//  Third login signup
//
//  Created by hosam on 1/21/21.
//

import SwiftUI

struct TFModifier: ViewModifier {
    
    
    func body(content: Content) -> some View {
        
       return content
        .padding()
        .background(Color.white)
        .cornerRadius(5)
        // shadow effect...
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
    }
}
