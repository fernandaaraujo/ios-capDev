//
//  Checklist.swift
//  Checklists
//
//  Created by Fernanda Araújo on 02/04/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
