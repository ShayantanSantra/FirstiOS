//
//  VideoViewController.swift
//  Test
//
//  Created by Shayantan Santra on 03/09/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class VideoViewController: UIViewController {

    @IBOutlet weak var VideoView: UIView!
    var player: AVPlayer!
    var layer: AVPlayerLayer!
    @IBOutlet weak var DurationLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var CurrentTimeLabel: UILabel!
    var isVideoPlaying = false
    override func viewDidLoad() {
        super.viewDidLoad()
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "MVI_1870", ofType: "mp4")!))
        player.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
        timeObserver()
        layer = AVPlayerLayer(player: player)
        layer.frame =  view.bounds
        layer.videoGravity = .resize
        //player.volume = 0
        VideoView.layer.addSublayer(layer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layer.frame = VideoView.bounds
    }
   /* override func viewDidAppear(_ animated: Bool) {
        /* let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)*/
        player.play()
    }*/
       
    @IBAction func Fastforward(_ sender: Any) {
        print("forward button")
        guard let duration = player.currentItem?.duration
            else{return}
        print(duration)
        let currenttime = CMTimeGetSeconds(player.currentTime())
        print(currenttime)
        let newtime = currenttime + 5.0
        print(newtime)
        if(newtime < CMTimeGetSeconds(duration) - 5.0){
            //print("Enter if loop")
            let time: CMTime = CMTimeMake(value: Int64(newtime*1000), timescale: 1000)
            player.seek(to: time)
        }
    }
    func timeObserver(){
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        let mainQueue = DispatchQueue.main
        _ = player.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: { [weak self] time in
            guard let currentItem = self?.player.currentItem else {return}
            self?.timeSlider.maximumValue = Float(currentItem.duration.seconds)
            self?.timeSlider.minimumValue = 0
            self?.timeSlider.value = Float(currentItem.currentTime().seconds)
            self?.CurrentTimeLabel.text = self?.getTimestring(from: currentItem.currentTime())
        })
    }
    
    @IBAction func Rewind(_ sender: Any) {
        let currenttime = CMTimeGetSeconds(player.currentTime())
        var newtime = currenttime - 5.0
        if(newtime < 5)
        {
            newtime = 0
        }
        
        let time: CMTime = CMTimeMake(value: Int64(newtime*1000), timescale: 1000)
        player.seek(to: time)
    
    }
    
    @IBAction func Play(_ sender: UIButton) {
        if isVideoPlaying{
            player.pause()
            isVideoPlaying = false
            print("paused")
            sender.setTitle("Play", for: .normal)
        }
        else{
             print("play")
            isVideoPlaying = true
            player.play()
            sender.setTitle("Pause", for: .normal)
        }
    }
    
    
    @IBAction func SliderValueChanged(_ sender: UISlider) {
        player.seek(to: CMTimeMake(value: Int64(sender.value*1000), timescale: 1000))
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "duration", let duration = player.currentItem?.duration.seconds, duration > 0.0 {
            self.DurationLabel.text = getTimestring(from: player.currentItem!.duration)
        }
    }
    func getTimestring(from time: CMTime) -> String{
        let totalseconds = CMTimeGetSeconds(time)
        let hours = Int(totalseconds/3600)
        let minutes = Int(totalseconds/60) % 60
        let seconds = Int(totalseconds.truncatingRemainder(dividingBy: 60))
        if hours > 0{
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        }
        else{
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
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
