//
//  sistemaPuntos.swift
//  gameStream
//
//  Created by Andrea Stefanny Garcia Mejia on 14/03/23.
//
//



import SwiftUI

struct sistemaPuntos: View {
    var body: some View {
        
        Rectangle().frame(width: 100, height: 100).foregroundColor(.blue)
    }
}

struct sistemaPuntos_Previews: PreviewProvider {
    static var previews: some View {
        sistemaPuntos()
        
        sistemaPuntos().previewDevice("iPhone 11")
        
        
        sistemaPuntos().previewDevice("iPad (10th generation)")
    }
}





















