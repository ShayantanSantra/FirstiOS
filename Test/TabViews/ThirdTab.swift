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
    @IBOutlet var Imageview: UIImageView!
    @IBOutlet var label: UILabel!
   // @IBOutlet weak var Button: UIButton!
    let pinchgesture = UIPinchGestureRecognizer()
    let  rotationgesture = UIRotationGestureRecognizer()
    @IBAction func PanAction(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: sender.view)
            let changeX = (sender.view?.center.x)! + translation.x
            let changeY = (sender.view?.center.y)! + translation.y
            sender.view?.center = CGPoint(x: changeX, y: changeY)
            sender.setTranslation(CGPoint.zero, in: sender.view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Imageview.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        Imageview.image = #imageLiteral(resourceName: "Random_image")
        Imageview.isUserInteractionEnabled = true
        //self.view.addSubview(Imageview)
        Imageview.center = view.center
        
        Imageview.addGestureRecognizer(pinchgesture)
        Imageview.addGestureRecognizer(rotationgesture)
        pinchgesture.addTarget(self, action: #selector(pinchaction))
        
        
        //navigationItem.leftBarButtonItems = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(goback))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goback))
        // Do any additional setup after loading the view.
    
   /* private func addgesture(){
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(didpinch()))
        view.addGestureRecognizer(pinch)
    }*/
        rotationgesture.addTarget(self, action: #selector(Rotation))
        
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        mainVC.passdata = self
        present(mainVC,animated: true)
    }
    
    @objc private func Rotation() {
        guard let gestureview = rotationgesture.view else{
            return
        }
        print("rotation")
        gestureview.transform = gestureview.transform.rotated(by: rotationgesture.rotation)
        rotationgesture.rotation = 0
        
    }
    @objc private func pinchaction(){
        guard let gestureview = pinchgesture.view else{
            return
        }
        gestureview.transform = gestureview.transform.scaledBy(x: pinchgesture.scale, y: pinchgesture.scale)
        pinchgesture.scale = 1
        print("zoom")
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

extension ThirdTab: JustShowDataDelegate{
    func didEnterData(name: String) {
        label.text = name
    }
    
    
}
