//
//  PickerView.swift
//  Test
//
//  Created by Shayantan Santra on 09/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit



class PickerView: UIViewController {
    private var datepicker: UIDatePicker?
    
    @IBOutlet weak var datelabel: UITextField!
    @IBOutlet var picker: UIPickerView!
    let data = ["Apple","Samsung","Nokia","OnePlus","Xiaomi","Micromax","Google"]
    override func viewDidLoad() {
        configuretapgesture()
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        datepicker = UIDatePicker()
        datelabel.inputView = datepicker
        datepicker?.datePickerMode = .date
        datepicker?.addTarget(self, action: #selector(datechange(datepicker:)), for: .valueChanged)
        
    }
        // Do any additional setup after loading the view.
        @objc func datechange(datepicker: UIDatePicker){
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM/dd/yyyy"
            datelabel.text = dateformatter.string(from: datepicker.date)
            
        }
    func configuretapgesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(taphandler))
        view.addGestureRecognizer(tap)
    }
    @objc func taphandler(){
        view.endEditing(true)
    }
}


extension PickerView : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    
}
extension PickerView : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
