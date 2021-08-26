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
    @IBOutlet weak var Button2: UIButton!
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
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipehandler))
        swipe.direction = .up
        swipe.numberOfTouchesRequired = 1
        view.addGestureRecognizer(swipe)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        view.addGestureRecognizer(longPress)
        let screenedge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgehandler))
        screenedge.edges = .right
        view.addGestureRecognizer(screenedge)
        view.isUserInteractionEnabled = true
    }
    @objc func taphandler(){
        print("Tap is registered")
        //self.navigationController?.popToViewController(viewcontrollers[1], animated: true)
        /*let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextview = storyboard.instantiateViewController(withIdentifier: "CollectionView") as! CollectionView
        self.present(nextview, animated: true, completion: nil)*/
        view.endEditing(true)
    }
    @objc private func edgehandler(){
        print("edge clicked")
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextview = storyboard.instantiateViewController(withIdentifier: "Table") as! TableView
        nextview.modalPresentationStyle = .automatic
        self.present(nextview, animated: true, completion: nil)
    }
    @objc func swipehandler(){
        print("Swiped")
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextview = storyboard.instantiateViewController(withIdentifier: "calci") as! CalculatorVC
        nextview.modalPresentationStyle = .automatic
        self.present(nextview, animated: true, completion: nil)
    }
    @objc func longPressHandler(){
        print("Long pressed")
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
            Button2.backgroundColor = .lightGray
            Heading.textColor = .white
            
            
        }
        else{
            view.backgroundColor = .white
            Button.backgroundColor = .orange
            Button2.backgroundColor = .gray
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


