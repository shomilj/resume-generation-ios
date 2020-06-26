//
//  ScoreVC.swift
//  Origin
//
//  Created by Shomil Jain on 10/26/19.
//  Copyright © 2019 Mobile Developers of Berkeley. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {

    var score = Double()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if score > 90 {
            textLabel.text = "Congratulations - you have what it takes to be a Silicon Valley recruiter!"
        } else if score > 70 {
            textLabel.text = "Not bad - but you can do better!"
        } else if score > 50 {
            textLabel.text = "Uh oh - the robots are infiltrating your company!"
        } else if score >= 0 {
            textLabel.text = "You should find a new job."
        }
        scoreLabel.text = String(Int(score)) + "%"
    }
    
}
