//
//  GameViewController+CollectionView.swift
//  TicTacToeApp
//
//  Created by xeadmin on 10/09/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import UIKit

extension GameViewController:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let blockCount = GameManager.shared.numberOfBlocks else{
            return 9
        }
        return blockCount * blockCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier.rawValue, for: indexPath) as! GameViewCell
        if let blockCount = GameManager.shared.numberOfBlocks{
            let player = GameManager.shared.board[indexPath.row / blockCount][indexPath.row % blockCount]
            
                cell.imageView.image = player.getImage()
            
        }
        
        return cell
    }
    
    
}

extension GameViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let blockCount:CGFloat = CGFloat(GameManager.shared.numberOfBlocks ?? 3)
        let collectionViewWidth = collectionView.frame.size.width
        let collectionViewHeight =  collectionView.frame.size.height
        return CGSize(width: collectionViewWidth / blockCount, height: collectionViewHeight / blockCount)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension GameViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let blockCount = GameManager.shared.numberOfBlocks{
        let player = GameManager.shared.board[indexPath.row / blockCount][indexPath.row % blockCount]
            if player != .none { return }
        }
        guard let blockCount = GameManager.shared.numberOfBlocks else { return }
        GameManager.shared.board[indexPath.row / blockCount][indexPath.row % blockCount] = GameManager.shared.currentChance
        if GameManager.shared.currentChance == .first {
            GameManager.shared.currentChance = .second
        }else{
            GameManager.shared.currentChance = .first
        }
        GameManager.shared.chances += 1
        if GameManager.shared.chances >= blockCount * 2 - 1{
            let result = GameManager.shared.checkForWin()
            if let winner = GameManager.shared.winner,result && winner == .first{
                self.status.text = "First Won"
                collectionView.allowsSelection = false
            }
            if let winner = GameManager.shared.winner,result && winner == .second{
                self.status.text = "Second Won"
                collectionView.allowsSelection = false
            }
            if GameManager.shared.chances == blockCount * blockCount  {
                self.status.text = "Draw"
            }
        }
        collectionView.reloadItems(at: [indexPath])
    }
}
