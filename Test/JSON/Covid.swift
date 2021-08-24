//
//  NewsFeed.swift
//  Test
//
//  Created by Shayantan Santra on 20/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

/*struct Response: Decodable {
    var status: String = ""
    var totalResults: Int = 0
    var articles:[Articles]
}
struct Articles: Decodable {
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
}
*/
struct Response: Decodable{
    let country: String
    let cases: Int
    let active: Int
    let tests: Int
    let recovered: Int
    let deaths: Int
   let countryInfo: Covid
}
struct Covid: Decodable {
    let flag: String
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
