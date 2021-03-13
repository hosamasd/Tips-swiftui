//
//  Tips_swiftuiApp.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

@main
struct Tips_swiftuiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}
