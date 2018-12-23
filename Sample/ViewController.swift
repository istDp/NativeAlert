//
//  ViewController.swift
//  Sample
//
//  Created by Durga Prasad on 22/11/18.
//  Copyright © 2018 Durga Prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let currentCountry = Utilities().getCountryFromLocale()
    let img  = InitialsImageFactory().imageWith(name: "AKhil")
    override func viewDidLoad() {
        super.viewDidLoad()

        Defaults.set(Messages.appName.value, forKey: Messages.appName)
        _ = Defaults.object(forKey: Messages.appName)
        _ = img ?? UIImage()
        
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
                let picker = ADCountryPicker(style: .grouped)
                picker.delegate = self
                picker.showCallingCodes = true
                let pickerNavigationController = UINavigationController(rootViewController: picker)
                self.present(pickerNavigationController, animated: true, completion: nil)
            case 1:
                print(1)
            default:
                break;
            }
        }
    }

}

//MARK:- country picker delegate
extension ViewController: ADCountryPickerDelegate {
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String, flagImg: UIImage) {
        _ = picker.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
