//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Kleyton josé dos santos on 28/03/18.
//  Copyright © 2018 KleytonCorporation. All rights reserved.
//

import Foundation
class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
