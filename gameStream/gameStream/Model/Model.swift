//
//  Model.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 23/02/23.
//

import Foundation

struct ApiResults:Codable{
    var results:[Game]
}

struct ApiGames:Codable{
    var games:[Game]
}
struct Game:Codable, Hashable{
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:videoUrl
    var galleryImages:[String]
}
struct videoUrl:Codable,Hashable{
    var mobile:String
    var tablet: String
}
