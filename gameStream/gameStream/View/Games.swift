//
//  Games.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 23/02/23.
//

import SwiftUI
import Kingfisher

struct Games: View {
    @ObservedObject var allGames = viewModel()
    @State var gameIsActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var platforms: [String] = [""]
    @State var tags: [String] = [""]
    @State var galleryImages: [String] = [""]
    
    let formGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack{
                Text("Juegos").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(EdgeInsets(top: 16.0, leading: 0, bottom: 64.0, trailing: 0))
                
                ScrollView{
                    LazyVGrid(columns: formGrid, spacing: 8){
                        ForEach(allGames.gameInfo, id: \.self){
                            game in
                            Button(action: {
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                contentRaiting = game.contentRaiting
                                publicationYear = game.publicationYear
                                description = game.description
                                platforms = game.platforms
                                tags = game.platforms
                                galleryImages = game.galleryImages
                                
                                print("Pulse el juego \(title)")
                                gameIsActive = true
                            }, label: {
                                KFImage(URL(string: game.galleryImages[0])!).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 4.0)).padding(.bottom, 12.0)
                                
                            })
                        }
                    }
                }
            }.padding(.horizontal, 6.0)
         
            NavigationLink(destination: gameView(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages), isActive: $gameIsActive,label:{
                EmptyView()
                
            })
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(perform: { print("primer elemento json \(allGames.gameInfo[0])")
            
        })
               
        
    }
}

struct Games_Previews: PreviewProvider {
    static var previews: some View {
        Games()
    }
}
