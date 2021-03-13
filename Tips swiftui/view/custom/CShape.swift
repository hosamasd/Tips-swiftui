//
//  CShape.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

struct CShape: Shape {
    var corners:UIRectCorner
    var width:CGFloat = 55
    
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners:corners , cornerRadii: CGSize(width: width, height: width))
        
        return Path(path.cgPath)
    }
}
