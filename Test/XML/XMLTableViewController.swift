import UIKit

struct Emp {
    var EmpTitle: String
    var EmpPos: String
}

class XMLTableViewController: UITableViewController, XMLParserDelegate {
    
    var emp: [Emp] = []
    var elementName: String = String()
    var empTitle = String()
    var empPosition = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.url(forResource: "Employee", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
    }
    
    // 1
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "emp" {
            empTitle = String()
            empPosition = String()
        
        }
        
        self.elementName = elementName
        
    }
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "emp" {
            let EMP = Emp(EmpTitle: empTitle, EmpPos: empPosition)
            emp.append(EMP)
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "name" {
                empTitle += data
            } else if self.elementName == "pos" {
                empPosition += data
            }
        }
    }
    
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return emp.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let Empl = emp[indexPath.row]

        cell.textLabel?.text = Empl.EmpTitle
        cell.detailTextLabel?.text = Empl.EmpPos

        return cell
    }
}
