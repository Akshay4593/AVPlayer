//
//  SongModel.swift
//  Test
//
//  Created by Akshay on 25/09/23.
//

import Foundation

struct SongModel: Codable {
    
    let songs: [Song]
    
}

struct Song: Codable {
    
    let artist: String
    let title: String
    let url: String
    
    init(artist: String, title: String, url: String) {
        self.artist = artist
        self.title = title
        self.url = url
    }
    
}
