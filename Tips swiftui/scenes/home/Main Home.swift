//
//  Main Home.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

struct Main_Home: View {
    
    @StateObject var pageData = PageViewModel()
    // Slide Animation...
    @Namespace var animation
    
    // Columns...
    //    let columns = Array(repeating: GridItem(.flexible(), spacing: 45), count: 2)
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    @State var index = 2
    @State var isTwo = false
    
    var body: some View {
        VStack{
            
            // Custom Picker....
            
            HStack{
                
                CustomText(index: $index, namespace: animation)
                    .onTapGesture {
                        withAnimation(.easeOut){
                            self.index = 1
                            columns.removeAll()
                            //                            columns.removeLast()
                            columns.append(GridItem(.flexible(), spacing: 20))
                            isTwo=true
                        }
                    }
                
                CustomText(index: $index, namespace: animation,name: 2)
                    .onTapGesture {
                        withAnimation(.easeOut){
                            self.index = 2
                            columns.removeAll()
                            columns.append(GridItem(.flexible(), spacing: 20))
                            columns.append(GridItem(.flexible(), spacing: 20))
                            //
                        }
                    }
                
                CustomText(index: $index, namespace: animation,name: 3)
                    .onTapGesture {
                        withAnimation(.easeOut){
                            self.index = 3
                            columns.removeAll()
                            columns.append(GridItem(.flexible(), spacing: 20))
                            columns.append(GridItem(.flexible(), spacing: 20))
                            columns.append(GridItem(.flexible(), spacing: 20))
                        }
                    }
                
            }
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.top)
            
            
            ScrollView{
                
                // Tabs With Pages....
                
                LazyVGrid(columns: columns,spacing: 20, content: {
                    
                    ForEach(pageData.gradients,id:\.name){page in
                        
                        GradientView(columns: $columns, gradient: page, vm: pageData)
//                        WebView(url: page.url)
//                            // UnComment This Just a try...
//                            //.opacity(pageData.currentPage?.id == page.id ? 0.01 : 1)
//                            .frame(height: 200)
//                            .cornerRadius(15)
                            // Drag And Drop ....
//                            .onDrag({
//
//                                // Comment This Just a try...
//
//                                // setting Current Page...
//                                pageData.currentPage = page
//
//                                // Sending ID For Sample...
//                                return NSItemProvider(contentsOf: URL(string: "\(page.id)")!)!
//                            })
                            .onDrag({
                                
                                // Comment This Just a try...
                                
                                // setting Current Page...
                                pageData.currentPage = page
                                
                                // Sending ID For Sample...
                                return NSItemProvider(contentsOf: URL(string: "\(page.name)"))!
                            })
                            .onDrop(of: [.url], delegate: DropViewDelegate(page: page,pageData: pageData))
                    }
                })
                .padding()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.5).ignoresSafeArea(.all, edges: .all))
    }
}

struct Main_Home_Previews: PreviewProvider {
    static var previews: some View {
        Main_Home()
    }
}
