//
//  LoginContentView.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

struct LoginContentView: View {
    @AppStorage ("home") var ss = false
    
    var body: some View {
        
        ZStack {
            
            LoginHome()
                .opacity(ss ? 0 : 1)
            
            if ss {
                Main_Home()
                    .transition(.move(edge: .bottom))
            }
            
        }
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}
