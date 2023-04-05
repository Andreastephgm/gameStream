//
//  gameView.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 5/03/23.
//

import SwiftUI
import AVKit
import Kingfisher

struct gameView: View {
    
    var url: String
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var galleryImages: [String]
    
    var body: some View {
        
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Video(url:url).frame(height: 300)
                ScrollView{
                    videoInfo(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages)
                    
                    Gallery(galleryImages: galleryImages)
                }.frame(maxWidth:.infinity)
            }
        }
    }
}

struct Video : View{
    var url: String
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct videoInfo: View{
    var url: String
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var galleryImages: [String]
    
    var body: some View{
        VStack(alignment: .leading){
            HStack(spacing: 30){
                Text("\(title)").foregroundColor(.white).font(.largeTitle).bold()
                
                Image(systemName: "heart.fill").frame(width: 160, height: 90).foregroundColor(.white)
            }
            
            HStack{
                Text("\(studio)").foregroundColor(.white).font(.body)
                Text("\(contentRaiting)").foregroundColor(.white).font(.body)
                Text("\(publicationYear)").foregroundColor(.white).font(.body)
            }
            
            Text("\(description)").foregroundColor(.white).font(.body)
            HStack{
                ForEach(tags, id: \.self){
                    tags in
                    Text("#\(tags)").foregroundColor(.white).font(.subheadline).padding(.top, 5)
                }
            }
            
        }
    }
}

struct Gallery:View{
    var galleryImages: [String]
    let formGrid = [
        GridItem(.flexible())
    ]
    var body: some View{
        VStack(alignment: .leading){
            Text("GALLERY").foregroundColor(.white).font(.largeTitle).bold().padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            ScrollView(.horizontal){
                LazyHGrid(rows: formGrid, spacing: 8.0){
                    ForEach(galleryImages, id: \.self){
                        galleryImages in
                        KFImage(URL(string: galleryImages)).resizable().aspectRatio(contentMode: .fit).frame(maxWidth: .infinity, maxHeight: 200, alignment: .leading)
                    }
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct gameView_Previews: PreviewProvider {
    static var previews: some View {
       gameView(url: "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4", title: "The Witcher 3: Wild Hunt", studio: "NBC", contentRaiting: "+12", publicationYear: "2016", description: "GAME ", platforms: ["MOBILE", "TABLET"], tags: ["MASCOTAS", "PLATAFORMAS"], galleryImages: ["https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}






