//
//  LiveVideoViewController.swift
//  Test
//
//  Created by Shayantan Santra on 08/09/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class LiveVideoViewController: UIViewController {
    @IBAction func playvideo(_ sender: AnyObject){
        guard let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/second-terra-267208.appspot.com/o/MVI_1870.mp4?alt=media&token=611bc408-8c61-46bf-bb0b-66219c4da42c") else {return}
    
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true)
        player.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
