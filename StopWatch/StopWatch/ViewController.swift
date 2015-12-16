//
//  ViewController.swift
//  StopWatch
//
//  Created by Alejandro Terrazas on 28/09/15.
//  Copyright (c) 2015 Alejandro Terrazas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var cont = 0

    @IBOutlet weak var tiempo: UILabel!
    
    @IBAction func play(sender: AnyObject) {
      timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        cont = 0
        tiempo.text = "0"
    }
  
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime()
    {
        cont++
        tiempo.text = "\(cont)"
    }


}

