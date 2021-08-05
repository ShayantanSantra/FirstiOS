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
        print("navigation VC")
        view.backgroundColor = .brown
        
        button.setTitle("Push New Controller", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapButton(){
        let rootvc = AnotherVC()
        
        let navVC = UINavigationController(rootViewController: rootvc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
        
        
    }
    class AnotherVC : UIViewController{
        let button=UIButton()
        override func viewDidLoad() {
            
            print("anotherVC")
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goback))
            view.backgroundColor = .darkGray
            title="HelloWorld"
            button.setTitle("Next View", for: .normal)
            view.addSubview(button)
            button.backgroundColor = .blue
            button.setTitleColor(.black, for: .normal)
            button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
            button.addTarget(self, action: #selector(Button2nd), for: .touchUpInside)
            
        }
        @IBAction func Button2nd(){
           let vc = ThirdVC()
           let thirdvc = UINavigationController(rootViewController: vc)
            thirdvc.modalPresentationStyle = .automatic
            present(thirdvc, animated: true)
            //vc.view.backgroundColor = .white
          //  navigationController?.pushViewController(vc, animated: true)
            
        }
        @objc private func goback(){
            dismiss(animated: true, completion: nil)
        }
        
    }
    class ThirdVC : UIViewController{
        let button = UIButton()
        override func viewDidLoad() {
            super.viewDidLoad()
            print("thirdvc")
            view.backgroundColor = .orange
            button.setTitle("test", for: .normal)
            view.addSubview(button)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
            button.addTarget(self, action: #selector(click), for: .touchUpInside)

        }
        @IBAction func click(){
            print("Button click")
            let viewControllerarray: [UIViewController] = self.navigationController!.viewControllers;
            print("\(viewControllerarray)")
           // self.navigationController!.popViewController(viewControllerarray[1],animated: true)
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
