//
//  Sight.swift
//  SightsTracker
//
//  Created by Admin on 03.01.16.
//  Copyright © 2016 ru.b00blik. All rights reserved.
//

import UIKit

class Sight{
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating<0{
            return nil
        }
    }
}
