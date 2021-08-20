//
//  NewsFeed.swift
//  Test
//
//  Created by Shayantan Santra on 20/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import Foundation

struct NewsFeed: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles:[Article]?
}
