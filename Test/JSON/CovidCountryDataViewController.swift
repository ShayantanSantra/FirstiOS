//
//  CovidCountryDataViewController.swift
//  Test
//
//  Created by Shayantan Santra on 24/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class CovidCountryDataViewController: UIViewController {

    @IBOutlet weak var TotalCases: UILabel!
    @IBOutlet weak var ActiveCases: UILabel!
    @IBOutlet weak var Recovered: UILabel!
    @IBOutlet weak var Test: UILabel!
    @IBOutlet weak var Deaths: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    var cov:Response?
    override func viewDidLoad() {
        super.viewDidLoad()
        TotalCases.text = "\(cov?.cases ?? 0)"
        ActiveCases.text = "\(cov?.active ?? 0)"
        Recovered.text = "\(cov?.recovered ?? 0)"
        Test.text = "\(cov?.tests ?? 0)"
        Deaths.text = "\(cov?.deaths ?? 0)"
        let urlString = cov!.countryInfo.flag
        let url = URL(string: urlString)!
        ImageView.downloaded(from: url)
        
        
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
