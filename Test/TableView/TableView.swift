//
//  TableView.swift
//  Test
//
//  Created by Shayantan Santra on 10/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class TableView: UIViewController {
    @IBOutlet var Table : UITableView!
    let contents = ["avbekjb","bfbaf","cffea","deh","ewtrhw","fwgrn","gwngr","hwngr"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        Table.register(nib, forCellReuseIdentifier: "CustomCell")
        Table.delegate = self
        Table.dataSource = self
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
extension TableView : UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",
                                                 for: indexPath) as! CustomCell
        cell.label.text = contents[indexPath.row]
        cell.myimg.backgroundColor = .red
        //cell.textLabel?.text = contents[indexPath.row]
        return cell
    }
}
extension TableView : UITableViewDataSource{
    
    
}
