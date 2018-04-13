//
//  AlbumDetailDataSource.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 11.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailDataSource:NSObject,UITableViewDataSource{
    private let songs: [Song]
    
    init(songs:[Song]){
        self.songs = songs
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.reuseIdentifier , for:indexPath) as! SongCell
        
        let song = songs[indexPath.row]
        let viewModel = SongViewModel(song: song)
        
        cell.TitleLabel.text = viewModel.title
        cell.songRunTimeLabel.text = viewModel.runTime
        
        
        return cell
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Tracks"
        default:
            return nil
        }
    }

}
