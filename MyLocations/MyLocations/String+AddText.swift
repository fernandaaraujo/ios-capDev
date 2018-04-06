//
//  String+AddText.swift
//  MyLocations
//
//  Created by Fernanda Araújo on 06/04/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import Foundation

extension String {
    mutating func add(text: String?,
                      separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
