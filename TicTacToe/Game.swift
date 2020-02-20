//
//  Game.swift
//  TicTacToe
//
//  Created by Kenny on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    //=======================
    // MARK: - State
    enum GameState {
        case active // Active player
        case cat
        case won // Winning player
    }
    
    //=======================
    // MARK: - inits
    ///New game
    init(board: GameBoard = GameBoard(), activePlayer: GameBoard.Mark? = .x) {
        self.board = board
        self.activePlayer = activePlayer
        self.gameState = .active
    }
    
    ///Test Case Init
    init(board: GameBoard, activePlayer: GameBoard.Mark?, gameState: GameState) {
        self.board = board
        self.activePlayer = activePlayer
        self.gameState = gameState
    }
    
    //=======================
    // MARK: - Properties
    private(set) var board: GameBoard
    internal var activePlayer: GameBoard.Mark?
    internal var gameState: GameState
    internal var gameIsOver: Bool {
        switch gameState {
        case .won:
            return true
        case .cat:
            return true
        case .active:
            return false
        }
    }
    internal var winningPlayer: GameBoard.Mark?
    
    //=======================
    // MARK: - Change Game State
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        gameState = .active
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        do {
            try board.place(mark: activePlayer ?? .x, on: coordinate)
            if isGameWon() {
                
            } else {
                let player = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                activePlayer = player
            }
        } catch {
            throw error
        }
    }
    
    @discardableResult mutating func isGameWon() -> Bool {
        // Check verticals
        for x in 0..<3 {
            var numMarks = 0
            for y in 0..<3 {
                if board[(x, y)] == activePlayer {
                    numMarks += 1
                }
            }
            if numMarks == 3 {
                gameState = .won
                winningPlayer = activePlayer
                return true
            }
        }
        
        // Check horizontals
        for y in 0..<3 {
            var numMarks = 0
            for x in 0..<3 {
                if board[(x, y)] == activePlayer {
                    numMarks += 1
                }
            }
            if numMarks == 3 {
                gameState = .won
                winningPlayer = activePlayer
                return true
            }
        }
        
        // Check diagonals
        let ltr: [Coordinate] = [(0,0), (1, 1), (2,2)]
        var numMatches = 0
        for coord in ltr {
            if board[coord] == activePlayer {
                numMatches += 1
            }
        }
        if numMatches == 3 {
            gameState = .won
            winningPlayer = activePlayer
            return true
        }
        
        let rtl: [Coordinate] = [(2,0), (1, 1), (0,2)]
        numMatches = 0
        for coord in rtl {
            if board[coord] == activePlayer {
                numMatches += 1
            }
        }
        if numMatches == 3 {
            gameState = .won
            winningPlayer = activePlayer
            return true
        }
        
        return false
    }
    
}
