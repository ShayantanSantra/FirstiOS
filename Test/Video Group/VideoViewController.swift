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
    //@IBOutlet weak var image: UIImage?
    @IBOutlet weak var FastForward: UIButton!
    @IBOutlet weak var Rewind: UIButton!
    @IBOutlet weak var DurationLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var CurrentTimeLabel: UILabel!
    @IBOutlet weak var play_pause_Button: UIButton!
    @IBOutlet weak var speaker_Button: UIButton!
    @IBOutlet weak var FullScreen: UIButton!
    
    var isVideoPlaying = false
    var HideControls = false
    var audio = true
    override func viewDidLoad() {
        super.viewDidLoad()
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "MVI_1870", ofType: "mp4")!))
        player.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIApplication.didChangeStatusBarOrientationNotification, object: nil)
        timeObserver()
        layer = AVPlayerLayer(player: player)
        layer.frame =  view.bounds
        layer.videoGravity = .resize
        //player.volume = 0
        VideoView.layer.addSublayer(layer)
        ConfigureTapGesture()
    }
   // override func viewWillAppear(_ animated: Bool) {
        //AppDelegate.deviceOrientation = .landscapeLeft
       // let value = UIInterfaceOrientation.landscapeLeft.rawValue
       // UIDevice.current.setValue(value, forKey: "orientation")
    //}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layer.frame = VideoView.bounds
    }
    @IBAction func Rotate(_ sender: UIButton) {
        let or = UIApplication.shared.statusBarOrientation
        print(or)
        switch or{
        case .landscapeRight:
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        case .portrait:
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        
        default :
            break
        }
    }
    
 //Controls Visibility
    func ConfigureTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tap)
    }
    @objc func tapped(){
        print("tap is registered")
        if HideControls == false{
            HideAll()
        }
        else{
            ShowAll()
        }
    }
    func ShowAll(){
        HideControls = false
        timeSlider.isHidden = false
        DurationLabel.isHidden = false
        CurrentTimeLabel.isHidden = false
        play_pause_Button.isHidden = false
        FastForward.isHidden = false
        Rewind.isHidden = false
        speaker_Button.isHidden = false
        FullScreen.isHidden = false
    }
    func HideAll(){
        HideControls = true
        play_pause_Button.isHidden = true
        timeSlider.isHidden = true
        DurationLabel.isHidden = true
        CurrentTimeLabel.isHidden = true
        play_pause_Button.isHidden = true
        FastForward.isHidden = true
        Rewind.isHidden = true
        speaker_Button.isHidden = true
        FullScreen.isHidden = true
    }
    func HideControlsAfterSeconds(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.HideAll()
        }
    }

    //Video control Logic
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
    @IBAction func Play(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
        if isVideoPlaying{
            
            player.pause()
            isVideoPlaying = false
            print("paused")
            sender.setImage(UIImage(systemName: "play"), for: .normal)
            //sender.setTitle("Play", for: .normal)
        }
        else{
             print("play")
            HideControlsAfterSeconds()
            isVideoPlaying = true
            player.play()
            sender.setImage(UIImage(systemName: "pause"), for: .normal)
            //sender.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func Speaker(_ sender: UIButton) {
        if audio == true {
            player.volume = 0
        speaker_Button.setImage(UIImage(systemName: "speaker.slash"), for: .normal)
            audio = false}
        else{
            audio = true
            player.volume = 1
            speaker_Button.setImage(UIImage(systemName: "speaker.3.fill"), for: .normal)
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
    @objc func orientationChanged() {
        let orientation = UIApplication.shared.statusBarOrientation
        switch orientation {
        case .landscapeLeft:
            DispatchQueue.main.asyncAfter(deadline: .now()){
                print(orientation)  
               self.navigationController?.setNavigationBarHidden(true, animated: true)
               self.tabBarController?.tabBar.isHidden = true
                self.videoViewPortraitConstraints()
            }
        case .landscapeRight:
            DispatchQueue.main.asyncAfter(deadline: .now()){
               self.videoViewPortraitConstraints()
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.tabBarController?.tabBar.isHidden = true
            }
        case .portrait:
            DispatchQueue.main.asyncAfter(deadline: .now()){
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.tabBarController?.tabBar.isHidden = false
            }
        default:
            break
        }
    }
    func videoViewPortraitConstraints(){
        layer.frame = view.bounds
        //image?.images = #imageLiteral(resourceName: <#T##String#>)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
}
