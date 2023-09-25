//
//  SongNameTableViewCell.swift
//  Test
//
//  Created by Akshay on 25/09/23.
//

import UIKit

final class SongNameTableViewCell: UITableViewCell {

    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var songNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(song: Song) {
        songNameLabel.text = song.title
    }
    
}
