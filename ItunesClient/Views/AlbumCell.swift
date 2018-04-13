//
//  AlbumCell.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 10.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
     static let reuseIdentifier = "AlbumCell"

    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var artWorkView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel:AlbumCellViewModel)  {
        albumTitleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        albumGenreLabel.text = viewModel.genre
    }

}
