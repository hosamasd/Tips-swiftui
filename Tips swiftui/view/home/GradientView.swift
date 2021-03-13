//
//  GradientView.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

struct GradientView: View {
    @Binding var columns:[GridItem]
    var gradient:Gradient
    var vm:PageViewModel
    
    
    var body: some View {
        VStack(spacing: 15){
            
            ZStack{
                
                LinearGradient(gradient: .init(colors: vm.HEXTORGB(colors: gradient.colors)), startPoint: .top, endPoint: .bottom)
                    .frame(height: 180)
                    .clipShape(CShape(corners: [.topRight,.bottomLeft]))
                    .cornerRadius(15)
                // context Menu...
                    .contentShape(CShape(corners: [.topRight,.bottomLeft]))
                    .contextMenu{
                        
                        Button(action: {
                            
                            // copying to copy Board..
                            
                            var colorCode = ""
                            
                            for color in gradient.colors{
                                
                                colorCode += color + "\n"
                            }
                            
                            UIPasteboard.general.string = colorCode
                            
                        }) {
                            
                            Text("Copy")
                        }
                    }
                
                Text(gradient.name)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
                
            if columns.count == 1{

                HStack(spacing: 15){

                    ForEach(gradient.colors,id: \.self){color in

                        Text(color)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
