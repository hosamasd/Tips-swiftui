//
//  extensions.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

extension View {
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
   
}

extension String {
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
