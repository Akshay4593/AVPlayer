//
//  SongListingViewModel.swift
//  Test
//
//  Created by Akshay on 25/09/23.
//

import Foundation

final class SongListingViewModel {
    
    func dataSource() -> [Song]? {
        
        guard let jsonData = readLocalJSONFile(forName: "SongsList")
        else {
            print("Unable to fetch json local data")
            return nil
        }
        
        return parse(jsonData: jsonData)?.songs
        
    }
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    private func parse(jsonData: Data) -> SongModel? {
        do {
            let decodedData = try JSONDecoder().decode(SongModel.self, from: jsonData)
            return decodedData
        } catch {
            print("Parsing error: \(error)")
        }
        return nil
    }
    
}
