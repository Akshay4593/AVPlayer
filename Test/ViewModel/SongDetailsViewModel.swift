//
//  SongDetailsViewModel.swift
//  Test
//
//  Created by Akshay on 25/09/23.
//

import Foundation
import AVFAudio

class SongDetailsViewModel {
    
    let songs: [Song]
    private var index: Int
    
    var player: AVAudioPlayer!
    
    init(songs: [Song], index: Int) {
        self.songs = songs
        self.index = index
        
    }
    
    
    func playParticularSong() {
        
         let url = songs[index].url
        guard let songUrl = URL(string: url) else {
            return
        }
        downloadFileFromURL(url: songUrl)
    }
    
    func playNextSong() {
    
        guard index >= 0 && index < (songs.count)-1 else {
            return
        }
        index += 1
        playParticularSong()
    }
    
    func playPrevSong() {
        
        guard index > 0 && index < songs.count else {
            return
        }
        index -= 1
        playParticularSong()
        
    }
    
    
    private func downloadFileFromURL(url: URL){

        var downloadTask: URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url) { [weak self] (_url, response, error) in
            if let __url = _url {
                self?.play(url: __url)
            }
        }
        downloadTask.resume()
    }
    
    private func play(url: URL) {
        print("playing \(url)")
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.volume = 1.0
            player.play()
        } catch let error as NSError {
            //self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
}
