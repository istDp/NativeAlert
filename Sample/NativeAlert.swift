//
//  NativeAlert.swift
//  Sample
//
//  Created by Durga Prasad on 01/12/18.
//  Copyright © 2018 Durga Prasad. All rights reserved.
//

import Foundation
import UIKit


typealias CompletionHandler = ((Int) -> Void)?
//Button Titles----------------------

enum AlertButtonTitle {
    case ok, cancel, settings, yes, no, delete
    
    var value: String {
        switch self {
        case .ok: return "OK"
        case .cancel: return "Cancel"
        case .settings: return "Settings"
        case .yes: return "YES"
        case .no: return "NO"
        case .delete: return "Remove"
        }
    }
}

//  Alert Messages Here----------
enum Messages {
    case appName
    case custom(String)  // Here you can show custome msg like server messages here
    case passwordMatch
    
    var value: String {
        switch self {
        case .appName : return "Yuppy"
        case .custom(let message) : return message
        case.passwordMatch : return "Incorrect password"
            
        }
    }
}

// Alert Extension for viewwcontroller---------------------------

extension UIViewController {
    
    func presentAlertWithTitle(title: Messages = .appName, message: Messages, options: AlertButtonTitle..., completion: CompletionHandler = nil) {
        let alertController = UIAlertController(title: title.value, message: message.value, preferredStyle: .alert)
        
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option.value, style: (options.count > 1 ? (option != .cancel ? .destructive : .cancel) : .default), handler: { (action) in
                if completion != nil{
                    completion!(index)
                }
            }))
        }
        if options.count == 0 {
            // delays execution of code to dismiss
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                alertController.dismiss(animated: true, completion: nil)
            })
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
