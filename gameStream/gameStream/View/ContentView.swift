//
//  ContentView.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ZStack{
                Spacer()
                Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1.0).ignoresSafeArea()
                VStack{
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    startEndView()
                }
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    struct startEndView:View{
        @State var typeStartEnd = true
        var body:some View{
            VStack{
                HStack{
                    Spacer()
                    Button("INICIA SESIÓN") {
                        typeStartEnd = true
                    }.foregroundColor(typeStartEnd ? .white: .gray).bold()
                    Spacer()
                    Button("REGISTRATE") {
                        typeStartEnd = false
                    }.foregroundColor(typeStartEnd ? .gray:.white).bold()
                    Spacer()
                }
                Spacer(minLength: 42.0)
                if typeStartEnd == true{
                    logInView()
                    
                }else{
                    signInView()
                }
            }
        }
    }
    
    struct logInView:View{
        @State var email = ""
        @State var contraseña = ""
        @State var isHomeActive = false
        var body: some View{
            ScrollView{
                VStack(alignment: .leading){
                    Text("Correo Electronico").foregroundColor(Color("Dark-Cian"))
                    
                    ZStack(alignment: .leading){
                        if email.isEmpty{
                            Text("Ejemplo@gmailcom").font(.caption).foregroundColor(.gray)
                        }
                        TextField("", text: $email).foregroundColor(.white)
                    }
                    
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    
                    Text("Contraseña").foregroundColor(Color("Dark-Cian"))
                    
                    ZStack(alignment: .leading){
                        if contraseña.isEmpty{
                            Text("******").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $contraseña).foregroundColor(.white)
                    }
                    
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    Text("Olvidaste tu contraseña?").foregroundColor(Color("Dark-Cian")).frame(width:300, alignment: .trailing).font(.footnote).offset(x:380.0, y:0.0)
                }.padding(.horizontal, 77.0)
                
                Button(action: logIn, label: {
                    Text("INICIAR SESIÓN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth:270, alignment: .center ).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color:.white,radius: 6))
                })
                Text("Inicia sesión con redes sociales").foregroundColor(.white).padding(EdgeInsets(top: 100, leading: 30, bottom: 20, trailing: 30))
                HStack{
                    Button(action: logInFacebook, label: {
                        Text("Facebook").foregroundColor(.white).fontWeight(.bold).padding(EdgeInsets( top: 10, leading: 40, bottom: 10, trailing: 40)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Blue-Gray"), lineWidth: 1.0)).background(Color("Blue-Gray"))
                    }).cornerRadius(10).font(.footnote)
                    
                    Button(action: logInTwitter, label: {
                        Text("Twitter").foregroundColor(.white).fontWeight(.bold).padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Blue-Gray"), lineWidth: 1.0)).background(Color("Blue-Gray"))
                    }).cornerRadius(10).font(.footnote)
                    
                }
                NavigationLink(destination: Home(),isActive: $isHomeActive,label: {
                    EmptyView()
                    }
            )}
            
        }
        func logIn(){
            SaveData().validate(email: email, password: contraseña)
            isHomeActive = true
        }
        func logInFacebook(){
            print("Facebook!")
        }
        func logInTwitter(){
            print("Facebook!")
        }
        
    }
    
    
    struct signInView: View{
        @State var newEmail = ""
        @State var newPassword = ""
        var body: some View{
            VStack(alignment: .center){
                Text("Elije una foto de perfil").foregroundColor(.white).fontWeight(.bold)
                Text("Puedes cambiar o elegirla mas adelante").foregroundColor(.gray).font(.footnote).fontWeight(.light).padding(.bottom)
                Button(action: takePhoto, label: {
                    ZStack{
                        Image("defaultImage").resizable().aspectRatio(contentMode: .fit).frame(width: 80,height: 80)
                        Image(systemName: "camera").resizable().aspectRatio(contentMode: .fit).frame(width: 30,height: 30).foregroundColor(.white)
                    }
                }).padding()
                ScrollView{
                    VStack(alignment: .leading){
                        Text("Correo Electronico*").foregroundColor(Color("Dark-Cian"))
                        
                        ZStack(alignment: .leading){
                            if newEmail.isEmpty{
                                Text("Ejemplo@gmailcom").font(.caption).foregroundColor(.gray)
                            }
                            TextField("", text: $newEmail).foregroundColor(.white)
                        }
                        
                        Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                        
                        Text("Contraseña*").foregroundColor(Color("Dark-Cian"))
                        
                        ZStack(alignment: .leading){
                            if newPassword.isEmpty{
                                Text("******").font(.caption).foregroundColor(.gray)
                            }
                            TextField("", text: $newPassword).foregroundColor(.white)
                        }
                        Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                        
                        Text("Cofirmar contraseña*").foregroundColor(Color("Dark-Cian"))
                        
                        ZStack(alignment: .leading){
                            if newPassword.isEmpty{
                                Text("******").font(.caption).foregroundColor(.gray)
                            }
                            TextField("", text: $newPassword).foregroundColor(.white)
                        }
                        Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                        
                    }.padding(.horizontal, 77.0)
                    
                    Button(action: createAccount, label: {
                     Text("REGÍSTRATE").fontWeight(.bold).foregroundColor(.white).frame(maxWidth:270, alignment: .center ).padding(EdgeInsets(top: 11, leading: 18, bottom: 20, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color:.white,radius: 6))
                     })
                    Text("Regístrate con redes sociales").foregroundColor(.white).padding()
                     HStack{
                     Button(action: signInFacebook, label: {
                     Text("Facebook").foregroundColor(.white).fontWeight(.bold).padding(EdgeInsets( top: 10, leading: 40, bottom: 10, trailing: 40)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Blue-Gray"), lineWidth: 1.0)).background(Color("Blue-Gray"))
                     }).cornerRadius(10).font(.footnote)
                     
                     Button(action: signInTwitter, label: {
                     Text("Twitter").foregroundColor(.white).fontWeight(.bold).padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Blue-Gray"), lineWidth: 1.0)).background(Color("Blue-Gray"))
                     }).cornerRadius(10).font(.footnote)
                     
                     }
                }
            }
        }
        func takePhoto(){
            print("Hola")
        }
        func createAccount(){
            print("Hola")
        }
        func signInFacebook(){
            print("Hola")
        }
        func signInTwitter(){
            print("Hola")
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            
            ContentView()
            
        }
    }
}
