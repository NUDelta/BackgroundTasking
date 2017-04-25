//
//  ViewController.swift
//  background-tasking
//
//  Created by Kapil Garg on 4/25/17.
//  Copyright © 2017 Kapil Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // background task
    let backgroundTaskManager = BackgroundTaskManager()
    let bgTask: BackgroundTaskManager = BackgroundTaskManager.shared()
    
    var bgTimer: Timer? = Timer()
    var bgDelayTimer: Timer? = Timer()
    
    //MARK: Background Task Functions
    @objc private func stopUpdates() {
        print("Background stopping updates")
        
        if (bgTimer != nil) {
            bgTimer!.invalidate()
            bgTimer = nil
        }
    }
    
    @objc private func stopWithDelay() {
        print("Background delay 50 seconds")
    }
    
    @objc private func restartUpdates() {
        print("Background restarting updates")
        
        if (bgTimer != nil) {
            bgTimer!.invalidate()
            bgTimer = nil
        }
        
        startBGTask()
    }

    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        
        startBGTask()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startBGTask() {
        // all the stuff for background tasking.
        if (bgTimer != nil) {
            return
        }
        
        let bgTask = BackgroundTaskManager.shared()
        bgTask?.beginNewBackgroundTask()
        
        // restart location manager after 1 minute
        let intervalLength = 60.0
        let delayLength = intervalLength - 10.0
        
        bgTimer = Timer.scheduledTimer(timeInterval: intervalLength, target: self, selector: #selector(ViewController.restartUpdates), userInfo: nil, repeats: false)
        
        // keep location manager inactive for 10 seconds every minute to save battery
        if (bgDelayTimer != nil) {
            bgDelayTimer!.invalidate()
            bgDelayTimer = nil
        }
        
        bgDelayTimer = Timer.scheduledTimer(timeInterval: delayLength, target: self, selector: #selector(ViewController.stopWithDelay), userInfo: nil, repeats: false)
    }
}

