//
//  PlayerViewController.swift
//  AudioPlayer
//
//  Created by Дмитрий Соколовский on 17.07.22.
//

import Foundation
import AVFoundation
import UIKit


class PlayerViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var currenTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var fullPlayerPlayPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!

    
    var player: AVAudioPlayer?
    var trackDurationSeconds = 0
    var currentTrack = "song1"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTrack(withName: "song1")
        //durationSlider.maximumValue = Float(player.duration.second)
    }
    
    func setupUI() {
        //updateCurrentTrackInfo()
        albumArtImageView.layer.cornerRadius = 5
        albumArtImageView.clipsToBounds = true
        durationSlider.setThumbImage(UIImage(named: "circle"), for: UIControl.State())
      
    }
    

    //MARK: IBActions
    
    @IBAction func didTapPlayPauseButton(_ sender: Any) {
        player?.play()
        updatePlayButton()
    }
    @IBAction func tapNextSong(_ sender: Any) {
        loadTrack(withName: getNextTrack())
        player?.play()
        
    }
    @IBAction func tapPreviousSong(_ sender: Any) {
        loadTrack(withName: getPreviousTrack())
        player?.play()
        
    }
    @IBAction func volumeSliderAction(_ sender: Any) {
        self.player?.volume = self.volumeSlider.value
    }
    @IBAction func durationSliderAction(_ sender: UISlider) {
        self.player?.currentTime = TimeInterval(sender.value)
    }
    
    private func loadTrack(withName name: String) {
        let path = Bundle.main.path(forResource: name, ofType:"mp3")!
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            durationSlider.maximumValue = Float(player?.duration ?? 0)
           
        } catch {
            print("couldn't load file :(")
    }
    
}
    private func getNextTrack() -> String {
        switch currentTrack {
        case "song1":
            currentTrack = "song2"
        case "song2":
            currentTrack = "song3"
        default:
            currentTrack =  "song1"
            
        }
        return currentTrack
    }
    
    private func getPreviousTrack() -> String {
        switch currentTrack {
        case "song1":
            currentTrack =  "song3"
        case "song3":
            currentTrack =  "song2"
        default:
            currentTrack =  "song1"
            
        }
        return currentTrack
    }
    
    func setPlayButtonIconToPause() {
        fullPlayerPlayPauseButton.setImage(UIImage(named:"MPPause"), for: UIControl.State())
    }
    func setPlayButtonIconToPlay() {
        fullPlayerPlayPauseButton.setImage(UIImage(named: "MPPlay"), for: UIControl.State())
    }
    
    func updatePlayButton() {
        if fullPlayerPlayPauseButton.imageView?.image == UIImage(named: "MPPlay") {
            fullPlayerPlayPauseButton.setImage(UIImage(named: "MPPause"), for: UIControl.State())
            playSong()
        } else {
            fullPlayerPlayPauseButton.setImage(UIImage(named: "MPPlay"), for: UIControl.State())
            pauseSong()
        }
    }
    
    @objc func pauseSong() {
        player?.pause()
        setPlayButtonIconToPlay()
    }
    
    @objc func playSong() {
        player?.play()
        setPlayButtonIconToPause()
    }
}
