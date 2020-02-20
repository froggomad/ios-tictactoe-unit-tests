//
//  Game.swift
//  TicTacToe
//
//  Created by Kenny on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        gameIsOver = false
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        do {
            try board.place(mark: activePlayer ?? .x, on: coordinate)
        } catch {
            throw error
        }
    }
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
}
