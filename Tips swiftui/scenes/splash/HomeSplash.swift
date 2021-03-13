//
//  HomeSplash.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

struct HomeSplash: View {
    
    @AppStorage ("state") var ss = false
    
    @State var onBoard = [
        
        Board(title: "Data Analysis", detail: "Data analysis is a process of inspecting, cleansing, transforming and modeling data with the goal of discovering useful information, informing conclusions and supporting decision-making.", pic: "b1"),
        
        Board(title: "Social Media", detail: "Social media are interactive computer-mediated technologies that facilitate the creation or sharing of information, ideas, career interests and other forms of expression via virtual communities and networks.", pic: "b2"),
        
        Board(title: "Software Development", detail: "Software development is the process of conceiving, specifying, designing, programming, documenting, testing, and bug fixing involved in creating and maintaining applications, frameworks, or other software components.", pic: "b3"),
        
    ]
    var colors:[Color] = [.red,.blue,.green]
    @State var offset:CGFloat = 0
    @State var index = 0
    
    var body: some View {
        //for fix ignoresSafeArea tabview
        ScrollView(.init()){
            
            
            TabView{
                ForEach(onBoard) {dd in
                    //                ForEach(colors.indices,id:\.self) {index in
                    if dd.title=="Data Analysis"{
                        VStack{
                            
                            Image(dd.pic)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                            
                            
                            
                            Text(dd.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, 35)
                            
                            Text(dd.detail)
                                .foregroundColor(.black)
                                .padding(.top)
                                .padding(.horizontal, 20)
                            
                            Spacer(minLength: 0)
                            
                        }
                        
                        .overlay(
                            
                            
                            //                        if index==0{
                            GeometryReader{proxy ->Color in
                                let minX = proxy.frame(in:.global).minX
                                
                                DispatchQueue.main.async {
                                    withAnimation(.default){
                                        self.offset = -minX
                                    }
                                }
                                return Color.clear
                            }
                            .frame(width: 0, height: 0)
                            ,alignment:.leading
                            
                        )
                    }else {
                        VStack{
                            
                            Image(dd.pic)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                            
                            
                            
                            Text(dd.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, 35)
                            
                            Text(dd.detail)
                                .foregroundColor(.black)
                                .padding(.top)
                                .padding(.horizontal, 20)
                            
                            
                            //                            Spacer(minLength: 0)
                            
                            if dd.title == "Software Development"{
                                
                                Button(action: {
                                    
                                    // Updating index...
                                    withAnimation{
                                        self.ss=true
                                    }
                                    
                                }) {
                                    
                                    //                                if self.index /†/== self.onBoard.count - 1{
                                    
                                    HStack(spacing: 30){
                                        
                                        Text(self.index == self.onBoard.count - 1 ? "" : "Login" )
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                        
                                    }
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 200)
                                    .background(Color.red)
                                    .clipShape(Capsule())
                                    .padding(.bottom, 20)
                                    
                                    //                                }/
                                }
                            }else {
                                Spacer(minLength: 0)
                            }
                            
                        }
                    }
                    //                    }
                    //                    }
                }
                //                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                
                //animated indicators
                HStack(spacing:15) {
                    ForEach(colors.indices,id:\.self) {index in
                        
                        Capsule()
                            .fill(Color.gray)
                            .frame(width: getIndex() == index ? 20 : 7, height: 7)
                        
                    }
                    
                }
                //smooth slide effects
                .overlay(
                    Capsule()
                        .fill(Color.red)
                        .frame(width:  20 , height: 7)
                        .offset(x:getOffsets())
                    ,alignment:.leading)
                
                .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .padding(.bottom)
                ,alignment: .bottom)
        }
        .ignoresSafeArea()
    }
    
    //getindex
    func getIndex() -> Int {
        let index = Int(round(Double(offset / getWidth())))
        
        return index
    }
    
    //get offset for capsule shape
    func getOffsets() -> CGFloat {
        //spacing:15
        //circle width:7
        let progress = offset / getWidth()
        
        return progress * 22
    }
}

struct HomeSplash_Previews: PreviewProvider {
    static var previews: some View {
        HomeSplash()
    }
}
