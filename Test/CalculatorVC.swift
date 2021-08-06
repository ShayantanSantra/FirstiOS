//
//  CalculatorVC.swift
//  Test
//
//  Created by Shayantan Santra on 03/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    @IBOutlet weak var input: UILabel!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var expression: UILabel!
    var result=""
    var firstinp=""
    var answer:Double=0.00
    
    func clear(){
        result = ""
        input.text=""
        output.text=""
        expression.text=""
        
        
    }
    func inp(data: String){
        result=result+data
        input.text=result
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        clear()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func zero(_ sender: Any) {
        inp(data: "0")
    }
    
    @IBAction func clr(_ sender: Any) {
        clear()
    }
    @IBAction func one(_ sender: Any) {
        inp(data: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        inp(data: "2")
    }
    @IBAction func three(_ sender: Any) {
        inp(data: "3")
    }
    @IBAction func four(_ sender: Any) {
        inp(data: "4")
    }
    @IBAction func five(_ sender: Any) {
        inp(data: "5")
    }
    @IBAction func six(_ sender: Any) {
        inp(data: "6")
    }
    @IBAction func seven(_ sender: Any) {
        inp(data: "7")
    }
    @IBAction func eight(_ sender: Any) {
        inp(data: "8")
    }
    @IBAction func nine(_ sender: Any) {
        inp(data: "9")
    }
    
   /* @IBAction func dot(_ sender: Any) {
        np(data: ".")
    }*/
    @IBAction func add(_ sender: Any) {
        firstinp=result
        clear()
        expression.text="+"
        
    }
    
    @IBAction func sub(_ sender: Any) {
        firstinp=result
        clear()
        expression.text="-"
    }
    @IBAction func mul(_ sender: Any) {
        firstinp=result
        clear()
        expression.text="x"
    }
    @IBAction func div(_ sender: Any) {
        firstinp=result
        clear()
        expression.text="/"
    }
    
    @IBAction func Remainder(_ sender: Any) {
        firstinp=result
        clear()
        expression.text="%"
    }
    @IBAction func equals(_ sender: Any) {
        if expression.text=="+" {
            expression.text = "="
        let myDouble1=atof(result)
        let myDouble2=atof(firstinp)
        let answer=myDouble2+myDouble1
            let c: String = String(format: "%.1f", answer)
            
            output.text="\(c)"
           // var mystring="1.2"
            
        }
        else if expression.text=="-"{
            expression.text = "="
            let myDouble1=atof(result)
            let myDouble2=atof(firstinp)
            let answer=myDouble2-myDouble1
                let c: String = String(format: "%.1f", answer)
                
                output.text="\(c)"
        }
        else if expression.text=="x"{
            expression.text = "="
            let myDouble1=atof(result)
            let myDouble2=atof(firstinp)
            let answer=myDouble2*myDouble1
                let c: String = String(format: "%.1f", answer)
                
                output.text="\(c)"
        }
        else if expression.text=="/"{
            expression.text = "="
            let myDouble1=atof(result)
            let myDouble2=atof(firstinp)
            let answer=myDouble2/myDouble1
                let c: String = String(format: "%.1f", answer)
                
                output.text="\(c)"
        }
       /* else if expression.text=="%"{
            
            let myDouble1=Int(result)
            let myDouble2=Int(firstinp)
            let answer=myDouble2 % myDouble1
                let c: String = String(format: "%.1f", answer)
                
                output.text="\(c)"
        }*/
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
