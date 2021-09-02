//
//  News_Struct.swift
//  Test
//
//  Created by Shayantan Santra on 01/09/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit
struct Fetch_News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [info]
}
struct info: Decodable {
    let author: String
    let title: String
    let description: String
    let urlToImage: String
    let content: String
}
extension UIImageView {
    func download(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func download(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
