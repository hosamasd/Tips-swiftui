//
//  PageViewModel.swift
//  CoverFlow (iOS)
//
//  Created by Balaji on 17/01/21.
//

import SwiftUI

class PageViewModel: ObservableObject{
    
    // Selected tab...
    @Published var selectedTab = "tabs"
    
    @Published var urls = [
        
        Page(url: URL(string: "https://github.com/hosamasd?tab=repositories")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6772031064807366656/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3Bs%2BMEy2mETcOdNwbGfBnWjQ%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_view_base-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6768802830871478273/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3Bs%2BMEy2mETcOdNwbGfBnWjQ%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_view_base-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6767394120458612736/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_featured%3BcnjjIkHVSZOdjNlxcAvDXg%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_self_edit_featured-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6757221015920635905/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_featured%3BcnjjIkHVSZOdjNlxcAvDXg%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_self_edit_featured-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6754713728941342720/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_featured%3BcnjjIkHVSZOdjNlxcAvDXg%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_self_edit_featured-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6749998827001917440/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_featured%3BcnjjIkHVSZOdjNlxcAvDXg%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_self_edit_featured-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6742403122611679232/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_featured%3BcnjjIkHVSZOdjNlxcAvDXg%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_self_edit_featured-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6616576967078752256/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_featured%3BcnjjIkHVSZOdjNlxcAvDXg%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_self_edit_featured-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6619589074888065024/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_featured%3BcnjjIkHVSZOdjNlxcAvDXg%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_self_edit_featured-featured_item_detail_view")!),
        Page(url: URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:6618399336457994240/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_featured%3BcnjjIkHVSZOdjNlxcAvDXg%3D%3D&licu=urn%3Ali%3Acontrol%3Ad_flagship3_profile_self_edit_featured-featured_item_detail_view")!),
    ]
    
    // Currently Dragging Page...
//    @Published var currentPage: Page?
    @Published var currentPage: Gradient?
    @Published   var gradients : [Gradient] = []

    init() {
        getColors()
    }
    
    func getColors(){
        
        // Loading JSON Data....
        
        let url = "https://raw.githubusercontent.com/ghosh/uiGradients/master/gradients.json"
        
        let seesion = URLSession(configuration: .default)
        
        seesion.dataTask(with: URL(string: url)!) { (data, _, _) in
            
            guard let jsonData = data else{return}
            
            do{
                
                // decoding Json...
                
                let colors = try JSONDecoder().decode([Gradient].self, from: jsonData)
                
                DispatchQueue.main.async {
                    self.gradients = colors
                }
                
            }
            catch{
                
                print(error)
            }
        }
        .resume()
    }
    
    // Converting HEX Number To UICOlor.....
    
    func HEXTORGB(colors: [String])->[Color]{
        
        var colors1 : [Color] = []
        
        for color in colors{
            
            // removing #...
            
            var trimmed = color.trimmingCharacters(in: .whitespaces).uppercased()
            
            trimmed.remove(at: trimmed.startIndex)
            
            var hexValue : UInt64 = 0
            Scanner(string: trimmed).scanHexInt64(&hexValue)
            
            let r = CGFloat((hexValue & 0x00FF0000) >> 16) / 255
            let g = CGFloat((hexValue & 0x0000FF00) >> 8) / 255
            let b = CGFloat((hexValue & 0x000000FF)) / 255
            
            colors1.append(Color(UIColor(red: r, green: g, blue: b, alpha: 1.0)))
        }
        
        return colors1
    }
}
