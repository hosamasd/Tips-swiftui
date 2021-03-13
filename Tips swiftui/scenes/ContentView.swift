//
//  ContentView.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage ("state") var ss = false
    var body: some View {
        ZStack {
            
            HomeSplash()
                .opacity(ss ? 0 : 1)
            
            if ss {
                LoginContentView()
                    .transition(.move(edge: .bottom))
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
