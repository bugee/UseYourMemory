//
//  ListModel.swift
//  UseYourMemory
//
//  Created by Krzysiek on 14.08.2014.
//  Copyright (c) 2014 EnterPoint. All rights reserved.
//

import UIKit
import CoreData

@objc(ListModel)
class ListModel: NSManagedObject {
    
    // properties feeding the atributes in our entity
    @NSManaged var name: String
    
}
