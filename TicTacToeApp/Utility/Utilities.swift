//
//  Utilities.swift
//  TicTacToeApp
//
//  Created by xeadmin on 10/09/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

class Utilities {
    static func displayMessage(message:String,viewController: ViewController){
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .actionSheet)
        viewController.present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            [weak alertController] in
            if let alertController = alertController, !alertController.isBeingDismissed {
                alertController.dismiss(animated: true, completion: nil)
                
            }
        }
    }
    
}

