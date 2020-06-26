//
//  WelcomeVC.swift
//  Origin
//
//  Created by Shomil Jain on 10/26/19.
//  Copyright © 2019 Mobile Developers of Berkeley. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playTapped(_ sender: Any) {
        // TODO: Load Stuff
        LoadingOverlay.shared.showOverlay(self.view)
        DispatchQueue.global(qos: .background).async {
            var reals = try! String(contentsOfFile: Bundle.main.path(forResource: "reals", ofType: "txt")!, encoding: String.Encoding.utf8)
            var fakes = try! String(contentsOfFile: Bundle.main.path(forResource: "fakes", ofType: "txt")!, encoding: String.Encoding.utf8)
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
                let next = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Game") as! GameVC
                next.reals = reals.split(separator: "\n").shuffled()
                next.fakes = reals.split(separator: "\n").shuffled()
                next.modalTransitionStyle = .crossDissolve
                next.modalPresentationStyle = .fullScreen
                self.present(next, animated: true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
