//
//  ViewController.swift
//  NavitationBars
//
//  Created by Alejandro Terrazas on 26/09/15.
//  Copyright (c) 2015 Alejandro Terrazas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var count = 0
    var minutos = 0
    var horas = 0
    @IBOutlet weak var time: UILabel!
    
    @IBAction func pause(sender: AnyObject) 
    {
        timer.invalidate()
    }
    
    @IBAction func stop(sender: AnyObject)
    {
        timer.invalidate()
        count = 0
        minutos = 0
        horas = 0i
        time.text = "0:0:0"
    }
    
    @IBAction func play(sender: AnyObject)
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }
    
    func updateTime()
    {
        count++
        if(count == 60)
        {
            count = 0
            minutos++
        }
        if(minutos == 60)
        {
            minutos = 0
            horas++
        }
        time.text="\(horas):\(minutos):\(count)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

