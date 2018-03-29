//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Fernanda Araújo on 27/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
