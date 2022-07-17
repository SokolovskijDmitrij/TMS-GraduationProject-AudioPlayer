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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var player: AVAudioPlayer?
    var currentTrack = "song1"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTrack(withName: "song1")
    }
    
    func setupUI() {
        //updateCurrentTrackInfo()
        albumArtImageView.layer.cornerRadius = 5
        albumArtImageView.clipsToBounds = true
                
        //AudioPlayer.defaultPlayer.delegate = self
    }
    

    //MARK: IBActions
    
    @IBAction func didTapPlayPauseButton(_ sender: Any) {
        player?.play()
    }
    @IBAction func tapNextSong(_ sender: Any) {
        loadTrack(withName: getNextTrack())
        player?.play()
        
    }
    
    @IBAction func tapPreviousSong(_ sender: Any) {
        loadTrack(withName: getPreviousTrack())
        player?.play()
        
    }
    
    private func loadTrack(withName name: String) {
        let path = Bundle.main.path(forResource: name, ofType:"mp3")!
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
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

}
