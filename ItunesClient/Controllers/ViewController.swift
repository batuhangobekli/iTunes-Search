//
//  ViewController.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 10.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchpoint = Itunes.search(term: "taylor Swift", media: .music(entity: .musicArtist, attribute: .artistTerm))
        
           print(searchpoint.request)
        
        let lookup = Itunes.lookup(id: 123123, entity: MusicEntity.album)
           print(lookup.request)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

