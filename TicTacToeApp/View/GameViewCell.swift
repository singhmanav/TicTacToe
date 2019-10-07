//
//  GameViewCell.swift
//  TicTacToeApp
//
//  Created by xeadmin on 10/09/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

class GameViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateView()
    }
    
    func updateView(){
        self.contentView.layer.borderWidth = 1.0
    }
}
