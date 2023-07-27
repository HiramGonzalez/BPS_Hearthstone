//
//  Info.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/25/23.
//

import Foundation

struct Classes: Codable {
    var classes: [String]
}

struct Info: Codable {
    var classes: Classes
}
