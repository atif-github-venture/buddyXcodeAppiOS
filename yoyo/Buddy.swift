//
//  Buddy.swift
//  yoyo
//
//  Created by Ahmed, Atif on 3/11/19.
//  Copyright © 2019 Ahmed, Atif. All rights reserved.
//

import Foundation
import UIKit

class Buddy {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    
    init?(name: String, photo: UIImage?) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
    
}
