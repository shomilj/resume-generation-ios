//
//  GameVC.swift
//  Origin
//
//  Created by Shomil Jain on 10/26/19.
//  Copyright © 2019 Mobile Developers of Berkeley. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    let generator = UINotificationFeedbackGenerator()
    
    var reals = [String.SubSequence]()
    var fakes = [String.SubSequence]()
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!

    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0

    var current = String()
    var currentReal = Bool()
    
    var correct = 0
    var total = 0
    
    let TOTAL_COUNT = 15
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showNext()
    }
    
    func startTimer() {
        timer?.invalidate()
        startTime = Date().timeIntervalSinceReferenceDate
        time = 0
        timer = Timer.scheduledTimer(timeInterval: 0.05,
                                     target: self,
                                     selector: #selector(advanceTimer(timer:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    //When the view controller is about to disappear, invalidate the timer
    override func viewWillDisappear(_ animated: Bool) {
      timer?.invalidate()
    }

    @objc func advanceTimer(timer: Timer) {
        time = 8.0 - (Date().timeIntervalSinceReferenceDate - startTime)
        if time <= 0 {
            self.flashRed()
            generator.notificationOccurred(.error)
            total += 1
            timer.invalidate()
            timerLabel.text = "0"
        } else {
            let timeString = String(format: "%.2f", time)
            timerLabel.text = timeString
        }
    }

    @IBAction func realTapped(_ sender: Any) {
        if timerLabel.text == "0" || currentLabel?.textColor == UIColor.systemRed || currentLabel?.textColor == UIColor.systemGreen {
            return
        }
        if currentReal {
            correct += 1
            flashGreen()
            generator.notificationOccurred(.success)
        } else {
            flashRed()
            generator.notificationOccurred(.error)
        }
        total += 1
    }
    
    func flashRed() {
        currentLabel.textColor = UIColor.systemRed
        delay()
    }
    
    func flashGreen() {
        currentLabel.textColor = UIColor.systemGreen
        delay()
    }
    
    func delay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.currentLabel.textColor = UIColor.white
            self.showNext()
        }
    }
    
    @IBAction func fakeTapped(_ sender: Any) {
        if timerLabel.text == "0" || currentLabel?.textColor == UIColor.systemRed || currentLabel?.textColor == UIColor.systemGreen {
            return
        }
        if !currentReal {
            correct += 1
            flashGreen()
            generator.notificationOccurred(.success)
        } else {
            flashRed()
            generator.notificationOccurred(.error)
        }
        total += 1
    }
    
    func showNext() {
        startTimer()
        progressLabel.text = "\(total)/\(TOTAL_COUNT)"
        if total == TOTAL_COUNT {
            self.done()
            return
        }
        if (Int.random(in: 0..<2)) == 1 {
            currentReal = true
            current = String(reals.popLast()!)
        } else {
            currentReal = false
            current = String(fakes.popLast()!)
        }
        self.currentLabel.text = current
    }
    
    func done() {
        let next = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Score") as! ScoreVC
        next.score = Double((Double(correct) / Double(total)) * 100)
        next.modalTransitionStyle = .crossDissolve
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }
    
}
