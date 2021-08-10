//
//  ThirdTab.swift
//  Test
//
//  Created by Shayantan Santra on 06/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class ThirdTab: UIViewController {
    @IBOutlet var switch1: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.leftBarButtonItems = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(goback))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goback))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchchange(_ sender: UISwitch) {
        if sender.isOn{
            view.backgroundColor = .darkGray
        
        }
        else{
            view.backgroundColor = .orange
        }
    }
   /* @IBAction func goback(){
       // let viewcontrollers: [UIViewController] = self.navigationController!.viewControllers;
        self.navigationController?.popViewController(animated: true)
    }*/
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
