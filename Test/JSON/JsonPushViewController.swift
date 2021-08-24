//
//  JsonPushViewController.swift
//  Test
//
//  Created by Shayantan Santra on 23/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class JsonPushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlstring: String = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlstring)
        guard url != nil else{
            return
        }
        var urlrequest = URLRequest(url: URL(string: urlstring)!)
        urlrequest.httpMethod = "post"
        let dictionary = ["userId":"Shayantan", "id": "shayantan.santra@gmail.com", "title": "12345", "body":"fkejgeivhfdivhsbkjh"]
        do{
            let requestbody = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            print("enter")
            urlrequest.httpBody = requestbody
            urlrequest.addValue("application/json", forHTTPHeaderField: "content-type")
        }catch let error {
            print(error.localizedDescription)
        }
        URLSession.shared.dataTask(with: urlrequest) { (data, response, error) in
            if(data != nil && data?.count != 0){
                let response = String(data: data!, encoding: .utf8)
                print(response!)
            }
        }
       

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
