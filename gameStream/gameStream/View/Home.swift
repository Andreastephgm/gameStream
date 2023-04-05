//
//  Home.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 15/02/23.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var tabSelected : Int = 2
    var body: some View {
        TabView(selection: $tabSelected){
            Profile().bold().font(.system(size: 40)).tabItem {
                Image(systemName: "person")
                Text("Profile")
            }.tag(0)
            Games().bold().font(.system(size: 40)).tabItem {
            Image(systemName: "gamecontroller")
            Text("Juegos")
            }.tag(1)
            homeScreen().bold().font(.system(size: 40)).tabItem {
            Image(systemName: "house")
            Text("Inicio")
            }.tag(2)
            Favorites().bold().font(.system(size: 40)).tabItem {
            Image(systemName: "heart")
            Text("Favoritos")
            }.tag(3)
        }.accentColor(.white)
        
        }
    
    init () {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(.gray)
        UITabBar.appearance().isTranslucent = true
        print("Iniciando las vistas de home")
    }
    }

struct homeScreen: View {
   
    var body: some View{
        
        ZStack{
            Color("marine")
            
            ScrollView {
                VStack{
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.vertical, 11.0).padding(.top, 50)
                    
                    subHome()
                    
                }.padding(.horizontal, 18.0)
                
            }
            
        }.ignoresSafeArea().navigationBarHidden(true).navigationBarBackButtonHidden(true)
    
    }
    
  
    
    struct subHome: View{
        @State var searchText = ""
        @State var isGameEmpty: Bool = false
        @ObservedObject var gameFound = SearchGame()
        @State var isGameViewActive: Bool = false
        
        @State var url: String = "https://dl.dropboxusercontent.com/s/7167kppqrp1l72s/Cuphead480.mp4"
        @State var title: String = ""
        @State var studio: String = ""
        @State var contentRaiting: String = ""
        @State var publicationYear: String = ""
        @State var description: String = ""
        @State var platforms: [String] = [""]
        @State var tags: [String] = [""]
        @State var galleryImages: [String] = [""]
        
        var device = UIDevice.current.model
        
        
        var body: some View{
            
            VStack{
                
                
                HStack{
                    
                    Button(action: {
                        
                        watchGame(name:searchText)
                        
                        
                    }, label: {
                        Image(systemName: "magnifyingglass").resizable().aspectRatio( contentMode: .fit).frame(height: 15).foregroundColor(searchText.isEmpty ? Color(.yellow): Color("Dark-Cian"))
                        
                    }).alert(isPresented: $isGameEmpty) {
                        Alert(title: Text("Error!"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                        
                    }
                
                    
                    ZStack(alignment: .leading){
                        if searchText.isEmpty{
                            Text("Escribe el juego!").font(.body).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        TextField("", text: $searchText).font(.body).foregroundColor(.white)
                    }
                    
                }
            }.padding([.top, .leading,.bottom], 11.0).background(Color("Blue-Gray")).clipShape(Capsule())
            
            
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.vertical)
            
            ZStack{
                Button {
                    watchGame(name: "theWitcher")
                    
                    
                } label: {
                    VStack(spacing: 0){
                        ZStack{
                            Image("theWitcher").resizable().scaledToFit()
                            Image(systemName: "play.circle.fill")
                        }
                        Text("The Witcher 3: Wild Hunt").font(.title3).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).background(Color("Blue-Gray"))
                    }
                    
                }
          
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.top)
            
            Text("CATEGORIAS SUGERIDAS PARA TÍ").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.vertical)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                if device == "iPad"{
                    HStack {
                        Button(action: {}) {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 320, height: 180)
                                Image("FPS").resizable().scaledToFit().frame(width: 84, height: 84)
                            }
                        }
                        
                        Button(action: {}) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 320, height: 180)
                                Image("RPG").resizable().scaledToFit().frame(width: 84, height: 84)
                            }
                        }
                        
                        Button(action: {}) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 320, height: 180)
                                Image("OpenWorld").resizable().scaledToFit().frame(width: 84, height: 84)
                            }
                        }
                    }
                    
                }else{
                    HStack {
                        Button(action: {}) {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("FPS").resizable().scaledToFit().frame(width: 42, height: 42)
                            }
                        }
                        
                        Button(action: {}) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("RPG").resizable().scaledToFit().frame(width: 42, height: 42)
                            }
                        }
                        
                        Button(action: {}) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("OpenWorld").resizable().scaledToFit().frame(width: 42, height: 42)
                            }
                        }
                    }
                }
            }
            
            Text("RECOMENDADO PARA TÍ").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.vertical)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                if device == "iPad"{
                    HStack {
                        Button {
                            watchGame(name: "grand")
                            
                            
                        } label: {
                            ZStack{
                                Image("grand").resizable().scaledToFit().frame(width: 320, height: 180)
                            }
                        }
                        
                        Button {
                            watchGame(name: "crash")
                            
                        } label: {
                            ZStack{
                                Image("crash").resizable().scaledToFit().frame(width: 320, height: 180)
                            }
                        }
                        
                        Button {
                            watchGame(name: "cupHead")
                            
                        } label: {
                            ZStack{
                                Image("cupHead").resizable().scaledToFit().frame(width: 320, height: 180)
                            }
                        }
                        Button {
                            watchGame(name: "Hades")
                            isGameViewActive = true
                        } label: {
                            ZStack{
                                Image("Hades").resizable().scaledToFit().frame(width: 320, height: 180)
                            }
                        }
                        
                    }
                    
                }else{
                    
                    HStack {
                        Button {
                            watchGame(name: "grand")
                            
                            
                        } label: {
                            ZStack{
                                Image("grand").resizable().scaledToFit().frame(width: 160, height: 90)
                            }
                        }
                        
                        Button {
                            watchGame(name: "crash")
                            
                        } label: {
                            ZStack{
                                Image("crash").resizable().scaledToFit().frame(width: 160, height: 90)
                            }
                        }
                        
                        Button {
                            watchGame(name: "cupHead")
                            
                        } label: {
                            ZStack{
                                Image("cupHead").resizable().scaledToFit().frame(width: 160, height: 90)
                            }
                        }
                        Button {
                            watchGame(name: "Hades")
                            isGameViewActive = true
                        } label: {
                            ZStack{
                                Image("Hades").resizable().scaledToFit().frame(width: 160, height: 90)
                            }
                        }
                        
                    }
                }
            }
                Text("RECOMENDADO PARA TÍ").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.vertical)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack{
                        Button {
                            watchGame(name: "abzu")
                            
                        } label: {
                            ZStack{
                                Image("abzu").resizable().scaledToFit().frame(width: 320, height: 180)
                            }
                            Button {
                                watchGame(name: "death")
                                
                            } label: {
                                ZStack{
                                    Image("death").resizable().scaledToFit().frame(width: 320, height: 180)
                                }
                            }
                            Button {
                                watchGame(name: "halo")
                                
                            } label: {
                                ZStack{
                                    Image("halo").resizable().scaledToFit().frame(width: 320, height: 180)
                                }
                            
                            }
                         
                            NavigationLink(destination: gameView(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages), isActive: $isGameViewActive) {
                                EmptyView()
                            }
                        }
                        
                        
                    }
                 
                }

        }
        
            func watchGame(name: String){
                gameFound.search(gameName: name)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    print("Cantidad E: \(gameFound.gameInfo.count)")
                    if gameFound.gameInfo.count == 0 {
                        isGameEmpty = true
                    }else{
                        url = gameFound.gameInfo[0].videosUrls.mobile
                        title = gameFound.gameInfo[0].title
                        studio = gameFound.gameInfo[0].studio
                        contentRaiting = gameFound.gameInfo[0].contentRaiting
                        publicationYear = gameFound.gameInfo[0].publicationYear
                        description = gameFound.gameInfo[0].description
                        platforms = gameFound.gameInfo[0].platforms
                        tags = gameFound.gameInfo[0].tags
                        galleryImages = gameFound.gameInfo[0].galleryImages
                        
                        isGameViewActive = true
                    }
                })
                }
          
        }
    
    
        struct Home_Previews: PreviewProvider {
                static var previews: some View {
                    Home()
                }
                
            }
        }
    

