//
//  articles.swift
//  Test
//
//  Created by Shayantan Santra on 20/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import Foundation

struct Article: Codable {
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
}
