//
//  PostData.swift
//  HackerNews
//
//  Created by Bhanuka Gamage on 12/9/19.
//  Copyright © 2019 Bhanuka Gamage. All rights reserved.
//

import Foundation

struct Results : Decodable {
    let hits : [Post]
}


struct Post : Decodable, Identifiable {
    
    var id : String {
        return objectID
    }
    
    let objectID : String
    let points : Int
    let title : String
    let url : String?
    
    
}
