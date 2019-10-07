//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by xeadmin on 10/09/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

    @IBAction func startGame(_ sender: Any) {
        guard let text = textField.text, let blockCount = Int(text) else{
            return
        }
        if blockCount > 10 {
            Utilities.displayMessage(message: "Please enter a value less than 10", viewController: self)
            return
        }
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else{
            return
        }
        GameManager.shared.numberOfBlocks = blockCount
        GameManager.shared.refresh()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

