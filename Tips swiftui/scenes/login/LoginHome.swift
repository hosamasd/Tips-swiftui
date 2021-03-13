//
//  LoginHome.swift
//  Tips swiftui
//
//  Created by hosam on 3/13/21.
//

import SwiftUI

struct LoginHome: View {
    
    @State var index = 0
    @Namespace var name
    @StateObject var vm = ModelData()
    @State var startAnimation = false
    
    var body: some View {
        
        ZStack {
            VStack{
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                
                HStack(spacing: 0){
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            
                            index = 0
                            startAnimation = false
                        }
                        
                        withAnimation(Animation.linear(duration: 1.0)) {
                            startAnimation = true
                        }
                        
                    }) {
                        
                        VStack{
                            
                            Text("Login")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(index == 0 ? .black : .gray)
                            
                            ZStack{
                                
                                // slide animation....
                                
                                Capsule()
                                    .fill(Color.black.opacity(0.04))
                                    .frame( height: 4)
                                
                                if index == 0{
                                    
                                    Capsule()
                                        .fill(Color("Color"))
                                        .frame( height: 4)
                                        .matchedGeometryEffect(id: "Tab", in: name)
                                }
                            }
                        }
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            
                            index = 1
                            startAnimation = false
                        }
                        
                        withAnimation(Animation.linear(duration: 1.0)) {
                            startAnimation = true
                        }
                        
                    }) {
                        
                        VStack{
                            
                            Text("Sign Up")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(index == 1 ? .black : .gray)
                            
                            ZStack{
                                
                                // slide animation....
                                
                                Capsule()
                                    .fill(Color.black.opacity(0.04))
                                    .frame( height: 4)
                                
                                if index == 1{
                                    
                                    Capsule()
                                        .fill(Color("Color"))
                                        .frame( height: 4)
                                        .matchedGeometryEffect(id: "Tab", in: name)
                                }
                            }
                        }
                    }
                    
                    
                    
                    
                }
                .padding(.top,30)
                
                
                // Login View...
                
                // Changing Views Based On Index...
                
                ZStack {
                    
                    
                    
                    if index == 0{
                        
                        Login( vm: vm)
                            .opacity(startAnimation ? 1.0 : 0.0)
                        
                    }
                    else{
                        
                        SignUp( vm: vm)
                            .opacity(startAnimation ? 1.0 : 0.0)
                        
                    }
                    
                    //                if !vm.isLoading {
                    //                    ActivityIndicator()
                    //                        .foregroundColor(Color("Color"))
                    //                        .background(Color.red)
                    //
                    //                }
                }
                
                Spacer()
            }
            if vm.isLoading {
                ActivityIndicator()
                    .foregroundColor(Color("Color"))
                    .frame(maxHeight:.infinity)
                    
                    .background(Color.black.opacity(0.3).ignoresSafeArea())
                
                
            }
            
        }
        .disabled(vm.isLoading ? true : false)
        .alert(isPresented: $vm.alert) {
            
            Alert(title: Text("Error"), message: Text(self.vm.alertMsg), dismissButton: .default(Text("Ok")))
        }
        
        .onAppear {
            withAnimation(Animation.linear(duration: 2.0)) {
                startAnimation = true
            }
            
        }
        
    }
}

struct LoginContentView_Prseviews: PreviewProvider {
    static var previews: some View {
        LoginHome()
    }
}
