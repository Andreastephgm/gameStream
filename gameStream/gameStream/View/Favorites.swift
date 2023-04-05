//
//  Favorites.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 8/03/23.
//

import SwiftUI
import AVKit

struct Favorites: View {
    @ObservedObject var allGames = viewModel()
    
    var body: some View {
        ZStack{
            Color("marine")
            VStack {
                Text("Favoritos").foregroundColor(.white).bold().font(.title).padding(.init(top: 100, leading: 0, bottom: 9.0, trailing: 0))
                ScrollView{
                    
                    VStack(spacing: 0) {
                      
                            ForEach(allGames.gameInfo, id: \.self) { Game in
                             
                                    VideoPlayer(player: AVPlayer(url: URL(string:  Game.videosUrls.mobile)!)).frame(height: 300)
                                
                                
                                Text("\(Game.title)").foregroundColor(.white).padding().frame(maxWidth: .infinity, alignment: .leading).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 3.0)).bold().font(.title3)
                            
                            
                        }.padding(.bottom, 6.0)
                    }
                    
                }.padding(.bottom, 8.0)
            }.padding(.horizontal, 6.0)
        }.navigationBarBackButtonHidden(true).navigationBarHidden(true).ignoresSafeArea()
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
