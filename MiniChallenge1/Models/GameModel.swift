//
//  GameModel.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 05/04/23.
//

import Foundation

struct Game:Identifiable{
    let id = UUID()
    let name:String
    let image:String
    let matchIndicator:String
    let genre:String
    let downloaded:Int
    
    //  x position
    var x: CGFloat = 0.0
    // y position
    var y: CGFloat = 0.0
    //  rotation angle
    var degree: Double = 0.0 
    
    static var data: [Game] {
            [
                Game(name: "Red Dead Redemption 2", image: "rdr2", matchIndicator: "98% Match", genre: "Action", downloaded: 24 ),
                Game(name: "Resident Evil 4 Remake", image: "re4", matchIndicator: "80% Match", genre: "Horror", downloaded: 80 ),
                Game(name: "Tekken 8", image: "tk8", matchIndicator: "70% Match", genre: "Fighting", downloaded: 20 ),
                Game(name: "Hogwarts Legacy", image: "hl", matchIndicator: "88% Match", genre: "RPG", downloaded: 100 ),
            ]
        }
}
