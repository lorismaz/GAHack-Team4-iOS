//
//  Cause.swift
//  GAHack-Team4-iOS
//
//  Created by Loris Mazloum on 10/28/16.
//  Copyright © 2016 Maz Labs. All rights reserved.
//

import Foundation

class Cause {
    let name: String
    //let description: String
    let imageUrl: String
   // let organizations: [Organization]
    
    public init(name: String, imageUrl: String) {
        self.name = name
        //self.description = description
        self.imageUrl = imageUrl
        //self.organizations = organizations
    }
    
    static func fromDictionary(dictionary: NSDictionary) -> Cause? {
        
        //Pull out each individual element from the dictionary
        guard let name = dictionary["name"] as? String,
            //let description = dictionary["description"] as? String,
            let imageUrl = dictionary["image_url"] as? String
            else {
                return nil
        }
        
        //Take the data parsed and create a Place Object from it
        return Cause(name: name, imageUrl: imageUrl)
    }
}
