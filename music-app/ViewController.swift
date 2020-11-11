//
//  ViewController.swift
//  music-app
//
//  Created by Paulo Dallastra on 11/8/20.
//  Copyright © 2020 Paulo Dallastra. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func chooseGenreButtonTouched(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                DispatchQueue.main.async {
                    self.playGenre(genre: sender.currentTitle!)
                }
            }
        }
    }
    
    @IBAction func stopButtonTouched(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTouched(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String){
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
    }
    
}

