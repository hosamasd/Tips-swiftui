//
//  SignUp.swift
//  Third login signup
//
//  Created by hosam on 1/21/21.
//

import SwiftUI

struct SignUp: View {
    
    @State var hide = false
    @State var secondHide = false
    @ObservedObject var vm = ModelData()

    var body: some View {
        
        VStack{
            
            HStack{
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer(minLength: 0)
                
            }
            .padding(.horizontal,25)
            .padding(.top,30)
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                Text("Email")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("Email", text: $vm.email_SignUp)
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
                        SecureField("Password", text: $vm.password_SignUp)
                            .modifier(TFModifier())
                    }else {
                        TextField("Password", text: $vm.password_SignUp)
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
                
                Text("RE Password")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                ZStack {
                    
                    if !hide {
                        SecureField("RE Password", text: $vm.reEnterPassword)
                            .modifier(TFModifier())
                    }else {
                        TextField("RE Password", text: $vm.reEnterPassword)
                            .modifier(TFModifier())
                    }
                }
                .overlay(
                    
                    Button(action: {withAnimation{self.secondHide.toggle()}}, label: {
                        Image(systemName: !secondHide ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding()
                    })
                    .buttonStyle(PlainButtonStyle())
                    ,alignment: .trailing
                )
                
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            // Login Button....
            
            Button(action: {withAnimation{vm.signUp()}}) {
                
                Text("Sign Up")
                    .modifier(SharedBTN(text: "Sign Up"))
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

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
