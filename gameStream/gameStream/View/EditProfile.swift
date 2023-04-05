//
//  EditProfile.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 8/03/23.
//

import SwiftUI

struct EditProfile: View {
    
    @State var profileImage: Image? = Image("profile")
    @State var isCameraActive = false
    
    
    var body: some View {
        ZStack{
            Color("marine").ignoresSafeArea()
            
            ScrollView {
                VStack {
                    
                    Text("Editar Perfil").fontWeight(.bold).foregroundColor(.white).frame(minWidth: 0,idealWidth: 100, maxWidth: .infinity, alignment: .center).padding(.bottom, 40).font(.title2)
                    
                    
                    Button(action: {isCameraActive = true }, label: {
                        ZStack {
                            profileImage!.resizable().aspectRatio( contentMode: .fill).frame(width: 100, height: 100).clipShape(Circle()).sheet(isPresented: $isCameraActive) {
                                
                                SUImagePickerView(sourceType: .photoLibrary, image: $profileImage, isPresented: $isCameraActive)
                            }
                            Image(systemName: "camera").resizable().frame(width: 30,height: 30).foregroundColor(.white).bold()
                        }
                    })
                    
                    editModule()

                }
            }
        }
      
    }
}

struct editModule: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    
    var body: some View{
        VStack(alignment: .leading, spacing: 1.0) {
            Text("Correo Electrónico").frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color("Dark-Cian")).padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0)).font(.title2).bold()
            
            ZStack(alignment: .leading){
                if email.isEmpty {
                    
                    Text(verbatim:"ejemplo@gmail.com").foregroundColor(.gray)
                }
                TextField( "", text: $email).frame(maxWidth: .infinity,alignment: .leading).foregroundColor(.white).bold()
            }
            Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
            
            Text("Contraseña").frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color("Dark-Cian")).padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0)).font(.title2).bold()
            
            ZStack(alignment: .leading){
                if password.isEmpty {
                    Text(verbatim:"introduce una nueva contraseña").foregroundColor(.gray)
                }
                TextField( "", text: $password).frame(maxWidth: .infinity,alignment: .leading).foregroundColor(.white).bold()
            }
            Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
            
            Text("Nombre").frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color("Dark-Cian")).padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0)).font(.title2).bold()
            
            ZStack(alignment: .leading){
                if name.isEmpty {
                    Text(verbatim:"introduce tu nombre de usuario").foregroundColor(.gray)
                }
                TextField( "", text: $name).frame(maxWidth: .infinity,alignment: .leading).foregroundColor(.white).bold()
            }
            Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
            
            
            Button(action: updateData, label: {
                Text("ACTUALIZAR DATOS").fontWeight(.bold).foregroundColor(.white).frame(maxWidth:270, alignment: .center ).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("Dark-Cian"), lineWidth: 3.0).shadow(color:.white,radius: 6))
            }).padding(EdgeInsets(top: 20, leading: 25, bottom: 0, trailing: 25))
        }.padding(.horizontal, 22.0)
    }
    
 
    
    func updateData(){
        let updatedDataObject = SaveData()
        let result = updatedDataObject.saveData(email: email, password: password, userName: name)
        print(result)
    }
  
  
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
    
}
