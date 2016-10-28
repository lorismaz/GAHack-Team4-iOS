//
//  Organization.swift
//  GAHack-Team4-iOS
//
//  Created by Loris Mazloum on 10/28/16.
//  Copyright © 2016 Maz Labs. All rights reserved.
//

import Foundation

class Organization {
    let name: String
    let description: String?
    let imageUrl: String?
    
    public init(name: String, description: String?, imageUrl: String?) {
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
    }
    
    
    
}
