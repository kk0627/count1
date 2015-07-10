//
//  ViewController.swift
//  lit_count1
//
//  Created by keita kutsuno on 2015/07/08.
//  Copyright (c) 2015年 keita kutsuno. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    @IBOutlet var myLabel: UILabel!
    var number : Int = 0
    var audioPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //再生する音源のURLを生成
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("cat", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)!
        
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func randomPlus() {
        //1〜5までのランダムな数字
        var randomNumber = Int(arc4random()%6)
        number += randomNumber
        
        if number%7 == 0 {
            self.view.backgroundColor = UIColor.blackColor()
            myLabel.textColor = UIColor.whiteColor()
            myLabel.text = String(number)
            audioPlayer.numberOfLoops = 1
            audioPlayer.play()
        }else{
            self.view.backgroundColor = UIColor.whiteColor()
            myLabel.textColor = UIColor.blackColor()
            myLabel.text = String(number)
        }
    }
    


}

