//
//  VideoModel.swift
//  Africa
//
//  Created by Vladimir Sukanica on 8.2.21..
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
