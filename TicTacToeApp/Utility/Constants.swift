//
//  Constants.swift
//  TicTacToeApp
//
//  Created by xeadmin on 10/09/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

enum Constants : String{
    case cellIdentifier = "cell"
}


enum Player{
    case first
    case second
    case none
    
    func getImage() -> UIImage?{
        switch self{
            case .first : return UIImage(named: "circle")
            case .second : return UIImage(named: "close")
            case .none : return nil
        }
    }
}
