//
//  ModelData.swift
//  Chattos
//
//  Created by hosam on 12/17/20.
//

import SwiftUI
//import Firebase

var height = UIScreen.main.bounds.height

class ModelData : ObservableObject {
    
    @AppStorage("main") var isMain: Bool = false
    @AppStorage("name") var names = ""
    
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var email_SignUp = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    
    //    @Published var emailForeget = ""
    // AlertView With TextFields....
    
    // Error Alerts...
    
    @Published var alert = false
    @Published var alertMsg = ""
    @Published var currentCode = "246810"
    // User Status....
    @AppStorage("email") var emails = ""
    @AppStorage("password") var passwords = ""
    
    @AppStorage("log_Status") var status = false
    
    // User choose bio and type name
    
    @AppStorage("after_log_signuup") var logOrSignup = false
    @AppStorage("log_Status") var logins = false
    @AppStorage ("home") var ss = false

    
    // Loading ...
    
    @Published var isLoading = false
    
    
    func checkEmailAndPassword() -> Bool {
        
        if email.isValidEmail && password.count >= 8 {
            return true
        }
        return false
        
    }
    
    func checkEmail(email:String) -> Bool {
        return  email.isValidEmail ? true : false
    }
    
    func checkPassword(email:String) -> Bool {
        return  email.count >= 6 ? true : false
    }
    
    func checkEmailAndPasswordAndRepeat() -> Bool {
        
        if email_SignUp.isValidEmail && password_SignUp.count >= 8 && reEnterPassword == password_SignUp{
            return true
        }
        return false
        
    }
    
    
    
    
    
    
    // Login...
    
    func login(){
        
        // checking all fields are inputted correctly...
        
        if email == "" || password == ""{
            
            self.alertMsg = "Fill the contents properly !!!"
            self.alert.toggle()
            return
        }
        
        if !checkEmail(email: email) {
            self.alertMsg = "Please type valid Email"
            self.alert.toggle()
            return
        }
        
        if !checkPassword(email: password) {
            self.alertMsg = "Password shouldn't less than  6 characters"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            
            self.isLoading.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
            withAnimation{
                self.isLoading.toggle()
                
                if self.email == "b@b.com" {
                    self.isMain=true
                    self.names=self.email
                    self.ss=true
                    return
                }else {
                    self.alertMsg = "Please type valid Email"
                    self.alert.toggle()
                    return
                }
                
                
            }
            
        }
    }
    
    // SignUp..
    
    func signUp(){
        
        // checking all fields are inputted correctly...
        
        if email_SignUp == "" || password_SignUp == "" || reEnterPassword == ""{
            
            self.alertMsg = "Fill the contents properly !!!"
            self.alert.toggle()
            return
        }
        //
        if !checkEmail(email: email_SignUp) {
            self.alertMsg = "Please type valid Email"
            self.alert.toggle()
            return
        }
        
        if !checkPassword(email: password_SignUp) {
            self.alertMsg = "Password should be more than  5 characters"
            self.alert.toggle()
            return
        }
        
        if reEnterPassword != password_SignUp {
            self.alertMsg = "Password and RePassword should be same!"
            self.alert.toggle()
            return
        }
        
        
        
        //
        withAnimation{
            
            self.isLoading.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
            withAnimation{
                self.isLoading.toggle()
                self.names=self.email_SignUp
                self.ss=true
            }
            
        }
    }
    

    
}
