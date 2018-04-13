//
//  AlbumDetailController.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 11.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    var album:Album?
    
   lazy var datasource:AlbumDetailDataSource = {
        return AlbumDetailDataSource(songs: self.album!.songs)
    }()

   
    @IBOutlet weak var albumReleaseDateLabel:UILabel!
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure(with: album!)
        tableView.dataSource = datasource
    }
    func configure(with album:Album){
        let viewModel = AlbumDetailViewModel(album:album)
        
        albumTitleLabel.text = viewModel.title
        albumGenreLabel.text = viewModel.genre
        albumReleaseDateLabel.text = viewModel.releaseDate
    }
    
}
