//
//  Login.swift
//  Third login signup
//
//  Created by hosam on 1/21/21.
//

import SwiftUI

struct Login: View {
    
    @State var hide = false
    @ObservedObject var vm = ModelData()
    
    
    var body: some View {
        
        VStack{
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Email")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("Email", text: $vm.email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    // shadow effect...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
                Text("Password")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                
                ZStack {
                    
                    if !hide {
                        SecureField("Password", text: $vm.password)
                            .modifier(TFModifier())
                    }else {
                        TextField("Password", text: $vm.password)
                            .modifier(TFModifier())
                    }
                }
                .overlay(
                    
                    Button(action: {withAnimation{self.hide.toggle()}}, label: {
                        Image(systemName: !hide ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding()
                    })
                    .buttonStyle(PlainButtonStyle())
                    ,alignment: .trailing
                )
                
                Button(action: {}) {
                    
                    Text("Forget Password")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding(.top,10)
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            // Login Button....
            
            Button(action: {withAnimation{vm.login()}}) {
                
                
                Text("Login")
                    .modifier(SharedBTN(text: "Login"))
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            
            
            
        }
//        .alert(isPresented: $vm.alert) {
//            
//            Alert(title: Text("Error"), message: Text(self.vm.alertMsg), dismissButton: .default(Text("Ok")))
//        }
    }
}

var social = ["twitter","fb","google"]

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
