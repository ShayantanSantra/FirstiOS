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
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //let contents = ["avbekjb","bfbaf","cffea","deh","ewtrhw","fwgrn","gwngr","hwngr"]
    var items:[Person]?

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        Table.register(nib, forCellReuseIdentifier: "CustomCell")
        Table.delegate = self
        Table.dataSource = self
        fetchdata()
        // Do any additional setup after loading the view.
    }
    func fetchdata(){
        do{
            self.items = try context.fetch(Person.fetchRequest())
            DispatchQueue.main.async {
                self.Table.reloadData()
            }
            
        }
        catch{
            
        }
    }
    
    @IBAction func AddData(_ sender: Any) {
        let alert = UIAlertController(title: "Add name", message: "Enter a name", preferredStyle: .alert)
        alert.addTextField()
        
        let submitbutton = UIAlertAction(title: "Submit", style: .default) { (action) in
            let txtfield = alert.textFields![0]
            let newPerson = Person(context: self.context)
            newPerson.name = txtfield.text
            newPerson.age = 20
            newPerson.gender = "male"
            
            do{
                try self.context.save()
            }
            catch{
                print("error")
            }
            self.fetchdata()
        }
        alert.addAction(submitbutton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
extension TableView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return contents.count
        return self.items?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",
                                                 for: indexPath) as! CustomCell
        let person = self.items![indexPath.row]
        cell.textLabel?.text = person.name
       // cell.myimg.backgroundColor = .red
        //cell.textLabel?.text = contents[indexPath.row]
        return cell
    }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Deleted") { (action, view, completionHandler) in
            
            let persontoremove = self.items![indexPath.row]
            self.context.delete(persontoremove)
            do{
                try self.context.save()
            }
            catch{
                print("Error")
            }
            self.fetchdata()
            
            
            
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let person = self.items![indexPath.row]
        let alert = UIAlertController(title: "Edit Person", message: "Enter a new name", preferredStyle: .alert)
        alert.addTextField()
        let textfield = alert.textFields![0]
        textfield.text = person.name
        
        let savebutton = UIAlertAction(title: "Save", style: .default) { (action) in
            
            
            let textfield = alert.textFields![0]
            person.name = textfield.text
            do{
                try self.context.save()
            }
            catch{
                
            }
            self.fetchdata()
      
    }
        alert.addAction(savebutton)
        self.present(alert, animated: true, completion: nil)
}

}
