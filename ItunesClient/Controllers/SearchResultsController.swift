//
//  SearchResultsController.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 10.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let dataSource = SearchResultDataSource()
    let client = ItunesAPIClient()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultController))
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = dataSource
        definesPresentationContext = true  //Searchbarı kapat
        
        }
            @objc func dismissSearchResultController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbums"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artist(at: indexPath)
                //artist.albums = Stub.albums
                
                 let albumListController = segue.destination as! AlbumListController
                
                client.lookupArtist(withId: artist.id) { artist, error in
                    albumListController.artist = artist
                    albumListController.tableView.reloadData()
                }
                
               
                
            }
        }
     }
}
extension SearchResultsController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        //dataSource.update(with: [Stub.artist])
        //tableView.reloadData()
        //(searchController.searchBar.text!)
    
        client.searchForArtist(with:  searchController.searchBar.text!){[weak self] artist, error in
            self?.dataSource.update(with: artist)
            self?.tableView.reloadData()
        }
        
    }
}
