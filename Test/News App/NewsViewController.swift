//
//  NewsViewController.swift
//  Test
//
//  Created by Shayantan Santra on 01/09/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit
import CoreData

class NewsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var NewsCollectionView: UICollectionView!
    var news = [Fetch_News]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-08-01&sortBy=publishedAt&apiKey=0ec583634519425cb1ce277e28e17252")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                //print("No error")
                let httpresonse = response as! HTTPURLResponse
                print(httpresonse.statusCode)
           
            do{
                self.news = try JSONDecoder().decode([Fetch_News].self, from: data!)
            }
            
            catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
                DispatchQueue.main.async {
                    print(self.news.count)
                }
            }
        }.resume()

        
        NewsCollectionView.delegate = self
        NewsCollectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCollectionViewCell
        //cell.News_Label.text = news[indexPath.row].articles.title
        return cell
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
