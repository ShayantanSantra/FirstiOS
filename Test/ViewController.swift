//
//  ViewController.swift
//  Test
//
//  Created by Shayantan Santra on 31/07/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var PriceText: UITextField!
    @IBOutlet weak var Discount: UITextField!
    @IBOutlet var switchdark: UISwitch!
    @IBOutlet weak var Final: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Heading: UILabel!
    override func viewDidLoad() {
       // view.backgroundColor = .cyan
        super.viewDidLoad()
        configuretxtfield()
        configuretapgesture()
    }
    
    private func configuretxtfield(){
        PriceText.delegate = self
        Discount.delegate = self
    }
    private func configuretapgesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(taphandler))
        view.addGestureRecognizer(tap)
    }
    @objc func taphandler(){
        print("Tap is registered")
        view.endEditing(true)
    }
    
    @IBAction func Calculate(_ sender: Any) {
        let mrp = Double(PriceText.text!)!
        let dis = Double(Discount.text!)!
        let finalprice = mrp - (mrp * dis/100.00)
        Final.text = "Rs\(finalprice)"
        view.endEditing(true)
        
    }
    @IBAction func switchchange(_ sender: UISwitch){
        if sender.isOn{
            view.backgroundColor = .darkGray
            Button.backgroundColor = .brown
            Heading.textColor = .white
            
            
        }
        else{
            view.backgroundColor = .white
            Button.backgroundColor = .orange
            Heading.textColor = .black
        }
    }
    
    
}
extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


