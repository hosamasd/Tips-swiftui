//
//  WebView.swift
//  Reorder Grid cells
//
//  Created by hosam on 3/13/21.
//

import SwiftUI
import WebKit

// WebView From UIKit....

struct WebView: UIViewRepresentable {

    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        
        let view = WKWebView()
        view.load(URLRequest(url: url))
        view.isUserInteractionEnabled = false
        
        // Scaling WEb View...
        view.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
