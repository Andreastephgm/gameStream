//
//  viewModel.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 23/02/23.
//

import Foundation
import Kingfisher

class viewModel:ObservableObject{
    
    @Published var gameInfo = [Game]()
    
    init() {
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){data,response, error in
            do{
                if let jsonData = data{
                    print("datos \(jsonData)")
                    
                    let decodeData = try
                    JSONDecoder().decode([Game].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData)
                    }
                }
            }catch{
                print("Error \(error)")
            }
            
        }.resume()
    }
}
