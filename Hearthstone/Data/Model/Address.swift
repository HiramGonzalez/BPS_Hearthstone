//
//  Address.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 8/3/23.
//

import Foundation

struct FormattedAddress: Codable {
    var formatted_address: String?
}

struct Results: Codable {
    var results: [FormattedAddress]
}
