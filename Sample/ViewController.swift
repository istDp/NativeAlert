//
//  ViewController.swift
//  Sample
//
//  Created by Durga Prasad on 22/11/18.
//  Copyright © 2018 Durga Prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func witAction(_ sender: Any) {
        usageOfAlert()
    }
    @IBAction func witouButton(_ sender: Any) {
        self.presentAlertWithTitle(message: .custom("")) // 1

    }
    
    @IBAction func WithouAction(_ sender: Any) {
        self.presentAlertWithTitle(message: .custom(""),options: .ok) // 1

    }
    func usageOfAlert(){
        
        self.presentAlertWithTitle(title: .appName, message: .passwordMatch, options: .ok,.no) { (option) in
            switch (option) {
            case 0:
                print(0)
            case 1:
                print(1)
            default:
                break;
            }
        }
    }

}

