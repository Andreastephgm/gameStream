//
//  SaveData.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 9/03/23.
//

import Foundation

class SaveData{
    
    var email: String = ""
    var password: String = ""
    var userName: String = ""
    
    func saveData(email:String, password: String, userName: String) -> Bool {
        print("We get \(email), \(password),\(userName)")
        
        UserDefaults.standard.set([email, password, userName], forKey: "userData")
        
        return true
    }
    
    func getBackData()-> [String]{
        
        let userData: [String] = UserDefaults.standard.stringArray(forKey: "userData")!
        
        print("get back \(userData)")
        
        return userData
    }
    
    func validate( email: String, password: String) -> Bool{
        var savedEmail : String = ""
        var savedPassword : String = ""
        
        print("datos del perfil \(email), \(password)")
        
        if UserDefaults.standard.object(forKey: "userData") != nil{
            
            savedEmail = UserDefaults.standard.stringArray(forKey: "userData")![0]
            savedPassword = UserDefaults.standard.stringArray(forKey: "userData")![1]
            print(" datos guardados \(savedEmail) y \(savedPassword)")
            
        }else{
            
            print("No hay datos guardados")
        }
        if email == savedEmail && password == savedPassword{
            
            return true
        }else{
            return false
        }
       
    }
    
}
