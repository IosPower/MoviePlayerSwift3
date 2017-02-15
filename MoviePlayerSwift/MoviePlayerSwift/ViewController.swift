//
//  ViewController.swift
//  MoviePlayerSwift
//
//  Created by piyush sinroja on 05/05/16.
//  Copyright © 2016 piyush sinroja. All rights reserved.
//


import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVPlayer()
    
    @IBOutlet weak var viewMovie: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SetupVideoPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        print("viewwillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func didPlayToEndTime(_ note: Notification) {
        print("didPlayToEndTime")
    }
    
    @IBAction func btnPlayFromBundle(_ sender: AnyObject) {
        print("viewDidAppear")
        player.play()
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didPlayToEndTime), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func SetupVideoPlayer()
    {
        print("viewDidAppear")
        
        let moviePath = Bundle.main.path(forResource: "video1", ofType: "mp4")
        
//        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:contentURL];
//        self.moviePlayer = [AVPlayer playerWithPlayerItem:playerItem];
//        playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.moviePlayer];
//        [playerLayer setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        [self.moviePlayer seekToTime:kCMTimeZero];
//        [self.layer addSublayer:playerLayer];
//        self.contentURL = contentURL;

        let urlstring: String = "http://content.uplynk.com/468ba4d137a44f7dab3ad028915d6276.m3u8"
        
        if let _: AnyObject = urlstring as AnyObject? {
            let videourl: URL = URL(string: urlstring)!
            let playerItemvideo = AVPlayerItem(url:videourl)
            player = AVPlayer(playerItem:playerItemvideo)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            // playerViewController.videoGravity = AVLayerVideoGravityResizeAspect
            playerViewController.showsPlaybackControls = true
            
            playerViewController.view.frame = CGRect(x: 0, y: 0, width: viewMovie.frame.size.width , height: viewMovie.frame.size.height-64)
            self.viewMovie.addSubview(playerViewController.view)
            self.addChildViewController(playerViewController)
        }
        
        
        
      /*  if let path = moviePath {
            let url = NSURL.fileURLWithPath(path)
            player = AVPlayer(URL: url)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            // playerViewController.videoGravity = AVLayerVideoGravityResizeAspect
            playerViewController.showsPlaybackControls = true
            
            //            self.presentViewController(playerViewController, animated: true) {
            //                if let validPlayer = playerViewController.player {
            //                    validPlayer.play()
            //                }
            
            playerViewController.view.frame = CGRectMake(0, 0, viewMovie.frame.size.width , viewMovie.frame.size.height-64)
            self.viewMovie.addSubview(playerViewController.view)
            self.addChildViewController(playerViewController)
            
            // }
        }*/
        
    }
    @IBAction func btnPlayFromUrl(_ sender: AnyObject) {
        player.play()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didPlayToEndTime), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
}
