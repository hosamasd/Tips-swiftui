//
//  Board.swift
//  Googel sign in with splash
//
//  Created by hosam on 1/25/21.
//

import SwiftUI

// Sample Data...

struct Board:Identifiable {
    var id = UUID().uuidString
    
    var title : String
    var detail : String
    var pic : String
}
