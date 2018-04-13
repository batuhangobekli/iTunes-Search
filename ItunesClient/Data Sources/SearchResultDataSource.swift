//
//  SearchResultDataSource.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 10.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit

class SearchResultDataSource: NSObject,UITableViewDataSource {
    
    private var data = [Artist]()

    override init() {
        super.init()
    }
    
    func update(with artists:[Artist])  {
        data = artists
    }
    
    //MARK: - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        
        let artist = data[indexPath.row]
        cell.textLabel?.text = artist.name
        
        return cell
        }
    //MARK: - Helper
    func artist(at indexPath:IndexPath)-> Artist {
        return data[indexPath.row]
        }
    }


