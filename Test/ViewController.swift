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
    @IBOutlet weak var Final: UILabel!
    override func viewDidLoad() {
       // view.backgroundColor = .cyan
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func  viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func Calculate(_ sender: Any) {
        let mrp = Double(PriceText.text!)!
        let dis = Double(Discount.text!)!
        let finalprice = mrp - (mrp * dis/100.00)
        Final.text = "Rs\(finalprice)"
        
    }
    
}

