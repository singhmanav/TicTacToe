//
//  GameManager.swift
//  TicTacToeApp
//
//  Created by xeadmin on 10/09/19.
//  Copyright © 2019 Manav. All rights reserved.
//

import Foundation

class GameManager  {
    
    static let shared = GameManager()
    var numberOfBlocks: Int! {
        willSet {
            board = Array(repeating: Array(repeating: Player.none, count: newValue), count: newValue)
        }
    }
    var currentChance = Player.first
    var winner: Player?
    var board = [[Player]]()
    var chances = 0
    private init() {}
    
    func refresh(){
        board = Array(repeating: Array(repeating: Player.none, count: numberOfBlocks), count: numberOfBlocks)
        currentChance = Player.first
        winner = nil
        chances = 0
    }
    
    func checkForWin() -> Bool{
        return checkForHorizontal() || checkForVertical() || checkForDiagonal() || checkForAntiDiagonal()
    }
    
    private func checkForHorizontal() -> Bool{
        
        for (indexRow,_) in board.enumerated(){
            var prev = board[indexRow][0]
            for (indexColumn,_) in board.enumerated(){
                let current = board[indexRow][indexColumn]
                if prev != current{
                    break
                }
                if indexColumn == numberOfBlocks - 1{
                    winner = current
                    return true
                }
                prev = current
            }
        }
        return false
    }
    
    private func checkForVertical() -> Bool{
        for (indexRow,_) in board.enumerated(){
            var prev = board[0][indexRow]
            for (indexColumn,_) in board.enumerated(){
                let current = board[indexColumn][indexRow]
                if prev != current{
                    break
                }
                if indexColumn == numberOfBlocks - 1{
                    winner = current
                    return true
                }
                prev = current
            }
        }
        return false
    }
    
    private func checkForDiagonal() -> Bool{
            var prev = board[0][0]
            for (indexColumn,_) in board.enumerated(){
                let current = board[indexColumn][indexColumn]
                if prev != current{
                    break
                }
                if indexColumn == numberOfBlocks - 1{
                    winner = current
                    return true
                }
                prev = current
            }
        return false
    }
    
    private func checkForAntiDiagonal() -> Bool{
            var prev = board[0][numberOfBlocks - 1]
            for (indexColumn,_) in board.enumerated(){
                let current = board[indexColumn][numberOfBlocks - 1 - indexColumn]
                if prev != current{
                    break
                }
                if current == Player.none{
                    continue
                }

                if indexColumn == numberOfBlocks - 1{
                    winner = current
                    return true
                }
                prev = current
            }
        return false
    }
    
}

