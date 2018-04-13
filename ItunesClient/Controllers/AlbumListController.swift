//
//  AlbumListController.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 10.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {
    
    private struct Constants{
        static let AlbumCellHeight: CGFloat = 80
    }
    var artist:Artist?{
        didSet {
            self.title = artist?.name
            dataSource.update(with: artist!.albums)
            tableView.reloadData()
        }
    }
    
    var dataSource = AlbumListDataSource(albums: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = artist?.name
        
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:  - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
    //MARK:  - NAVIGATION
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum"{
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let selectedAlbum = dataSource.album(at:selectedIndexPath)
                
                selectedAlbum.songs = Stub.songs
                
                let albumDetailContoller = segue.destination as! AlbumDetailController
                albumDetailContoller.album = selectedAlbum
            }
        }
    }
        
    
}
