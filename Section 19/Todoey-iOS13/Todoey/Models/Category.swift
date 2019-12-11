//
//  Category.swift
//  Todoey
//
//  Created by Bhanuka Gamage on 12/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    
    @objc dynamic var name : String = ""
    
    let items = List<Item>()
    
    
    
}
