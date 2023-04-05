//
//  Profile.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 8/03/23.
//

import SwiftUI

struct Profile: View {
    
@State var nameProfile = "Andrea Stephanie"
    @State var photo: UIImage = UIImage(named: "profile")!
    var body: some View {
        ZStack{
            Color("marine").ignoresSafeArea().navigationBarBackButtonHidden(true).navigationBarHidden(true)
            VStack {
                Text("Perfil").fontWeight(.bold).foregroundColor(.white).frame(minWidth: 0,idealWidth: 100, maxWidth: .infinity, alignment: .center).padding(.bottom, 40).font(.title2)
                
                VStack {
                    Image(uiImage: photo).resizable().aspectRatio( contentMode: .fill).frame(width: 100, height: 110).clipShape(Circle())
                    Text(nameProfile).fontWeight(.bold).foregroundColor(.white).frame(minWidth: 0,idealWidth: 100, maxWidth: .infinity, alignment: .center).padding(.bottom, 40).font(.title3)
                }.padding(.top,5)
                
                Text("AJUSTES").fontWeight(.bold).foregroundColor(.white).frame(minWidth: 0,idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 10).font(.title2)
                
                settingModule()
            }
        }.onAppear {
            if returnImage(named: "profilePhoto.png" ) !=  nil {
                photo = returnImage(named: "profilePhoto.png")!
            }else{
                print("No se encontró foto")
            }
            if UserDefaults.standard.object(forKey: "userData") != nil {
                nameProfile = UserDefaults.standard.stringArray(forKey: "userData")![2]
            }
           
        }
    }
    func returnImage(named : String) -> UIImage?{
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask,  appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
}

struct settingModule: View{
    @State var isToggleOn = false
    @State var isEditProfileViewActive = false
    
    var body: some View{
        
        VStack {
            HStack {
                Button(action: {},
                       label:{
                    Text("Cuenta").foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 10, bottom: 4, trailing: 10)).font(.body)
                    
                }).frame(maxWidth: .infinity,alignment: .leading)
                
                Button(action: {},
                       label:{
                    Text(">").foregroundColor(.white).padding(.trailing, 10).font(.body)
                    
                }).frame(height: 50,alignment: .trailing)
                
            }.background(Color("Blue-Gray")).frame(maxWidth: .infinity)
            
            HStack {
                Button(action: {},
                       label:{
                    Text("Notificaciones").foregroundColor(.white).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).font(.body)
                    
                }).frame(maxWidth: .infinity,alignment: .leading)
                
                Button(action: {notifications()},
                       label:{
                    Toggle("", isOn: $isToggleOn).foregroundColor(.white).padding(EdgeInsets(top: 0, leading: 10, bottom: 5.0, trailing: 10)).font(.body)
                    
                }).frame(height: 50,alignment: .trailing)
                
            }.background(Color("Blue-Gray")).frame(maxWidth: .infinity)
            
            HStack {
                Button(action: {isEditProfileViewActive = true},
                       label:{
                    Text("Editar Perfil").foregroundColor(.white).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).font(.body)
                    
                 
                    
                }).frame(maxWidth: .infinity,alignment: .leading)
                
                Button(action: {isEditProfileViewActive = true},
                       label:{
                    Text(">").foregroundColor(.white).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).font(.body)
                    
                }).frame(height: 50,alignment: .trailing)
                
            }.background(Color("Blue-Gray")).frame(maxWidth: .infinity)
            
            HStack {
                Button(action: {},
                       label:{
                    Text("Califica esta aplicación").foregroundColor(.white).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).font(.body)
                    
                }).frame(maxWidth: .infinity,alignment: .leading)
                
                Button(action: {},
                       label:{
                    Text(">").foregroundColor(.white).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).font(.body)
                    
                }).frame(height: 50,alignment: .trailing)
                
            }.background(Color("Blue-Gray")).frame(maxWidth: .infinity)
        }.padding(.bottom, 100)
        
        NavigationLink(destination: EditProfile(), isActive:$isEditProfileViewActive,label: {
            EmptyView()
        })
    }

    func notifications(){
        isToggleOn = true
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
