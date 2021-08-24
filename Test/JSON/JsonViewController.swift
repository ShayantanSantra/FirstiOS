//
//  JsonViewController.swift
//  Test
//
//  Created by Shayantan Santra on 20/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit
import CoreData
//import PlaygroundSupport

class JsonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet var Searchbar : UISearchBar!
// var covid = [Covid]()
    var array = [String]()
    var resp = [Response]()
    //var news = [Articles]()
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            print("Success")
            self.tableview.reloadData()
        }
       tableview.delegate = self
       tableview.dataSource = self
    }
        
        /*let urlString: String = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0ec583634519425cb1ce277e28e17252"
       // let urlString: String = "https://jsonplaceholder.typicode.com/posts/1"
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) { (data, response,error) in
            if error == nil {
                let httpresponse = response as! HTTPURLResponse
                print(httpresponse.statusCode)
                if(httpresponse.statusCode == 200){
                    //data parsing
                    let jsondata = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                   // print(jsondata)
                   // let result = jsondata as! Dictionary<String, Any>
                   // print(result["name"]!)
                    
                }
                
               /* do{
                   let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    print(newsFeed)
                    
                }
                catch{
                    print("error")
                }*/
               // let jsondata = try? JSONserialisation.jsonObject
            }
        }
        datatask.resume()*/
        // Do any additional setup after loading the view.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("Covid count:\(covid.count)")
       
        return resp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
       // print(news[indexPath.row].
        //cell.textLabel?.text = news[indexPath.row].title
       // cell.textLabel?.text = Response[indexPath.row].country.capitalized
       // cell.textLabel?.text = Response[indexPath.row].count
        array.append("\(resp[indexPath.row].country)")
        print(array)
        cell.textLabel?.text = "\(resp[indexPath.row].country)"
        //print(indexPath.row)
        //print("\(resp[indexPath.row].country)")
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? CovidCountryDataViewController{
            dest.cov = resp[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
    func downloadJSON(Completed: @escaping() -> ()){
        let url = URL(string: "https://disease.sh/v3/covid-19/countries")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                let httpresponse = response as! HTTPURLResponse
                print(httpresponse.statusCode)
                do {
                    //let decoder = JSONDecoder()
                    //let JSONresponse = try decoder.decode([Covid].self, from: data!)
                    //self.covid = JSONresponse.
                   // print(JSONresponse.totalResults)
                    let cov_data = try JSONDecoder().decode([Response].self, from: data!)
                    //print(cov_data)
                    for i in cov_data{
                        self.array.append(i.country)                         //print("enter")
                        
                    }
                    self.resp = cov_data
                    print(self.array)
                    
                    //print(self.resp[20].country)
                   // print(news)
                   // print("hello")
                    DispatchQueue.main.async {
                       Completed()
                       // print("check\(self.news)")
                    }
                }catch{
                    print("JSON ERROR")
                }
            }
        }.resume()
    }
   /* func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
           let predicate = NSPredicate(format: "\(array) contains @", searchText)
            let req: NSFetchRequest = self.fetchRequest()
            req.predicate = predicate
            do{
                //print("yes")
                self.items = try context.fetch(req)
                
            }
            catch{
                print("error")
                }
           // self.Table.reloadData()
        }*/
    }



