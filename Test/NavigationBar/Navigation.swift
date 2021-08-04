//
//  Navigation.swift
//  Test
//
//  Created by Shayantan Santra on 04/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class Navigation: UIViewController {
    let button = UIButton()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        button.setTitle("Push New Controller", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        

        // Do any additional setup after loading the view.
    }
    @objc private func didTapButton(){
        let rootvc = AnotherVC()
        
        let navVC = UINavigationController(rootViewController: rootvc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
        
        
    }
    class AnotherVC : UIViewController{
        let button=UIButton()
        override func viewDidLoad() {
            
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goback))
            view.backgroundColor = .darkGray
            title="HelloWorld"
            button.setTitle("ButtonTwo", for: .normal)
            view.addSubview(button)
            button.backgroundColor = .blue
            button.setTitleColor(.black, for: .normal)
            button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            
        }
        @objc private func didTapButton(){
           /* let vc = UIViewController()
            vc.view.backgroundColor = .white
            navigationController?.pushViewController(vc, animated: true)*/
            
        }
        @objc private func goback(){
            dismiss(animated: true, completion: nil)
        }
        
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
