//
//  JsonViewController.swift
//  Test
//
//  Created by Shayantan Santra on 20/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2021-07-20&sortBy=publishedAt&apiKey=0ec583634519425cb1ce277e28e17252"
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) { (data, response,error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do{
                   let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    print(newsFeed)
                    
                }
                catch{
                    print("error")
                }
            }
        }
        datatask.resume()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
