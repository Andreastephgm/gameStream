//
//  SearchGame.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 6/03/23.
//

import Foundation

class SearchGame: ObservableObject{
    @Published var gameInfo = [Game]()
    
    func search(gameName: String){
        
        gameInfo.removeAll()
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){data,response, error in
            do{
                if let jsonData = data{
                    print("datos \(jsonData)")
                    
                    let decodeData = try
                    JSONDecoder().decode(ApiResults.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
            }catch{
                print("Error \(error)")
            }
            
        }.resume()
    }
}
