//
//  SongDetailsViewController.swift
//  Test
//
//  Created by Akshay on 25/09/23.
//

import UIKit

final class SongDetailsViewController: UIViewController {

    var viewModel: SongDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func playPauseAction(_ sender: Any) {
        
        viewModel.playParticularSong()
        
    }
    
    
    
    func play() {
        
    }
   
    func pause() {
        
        
    }
    
    func playPrev() {
        
        
    }
    
    
    func playNext() {
        
        
    }

}
