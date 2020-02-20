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
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    init(board: GameBoard = GameBoard(), activePlayer: GameBoard.Mark?) {
        self.board = board
        self.activePlayer = activePlayer
        self.gameState = GameState.active(.x)
    }
    
    //=======================
    // MARK: - Test init
    init(board: GameBoard, activePlayer: GameBoard.Mark?, gameState: GameState?) {
        self.board = board
        self.activePlayer = activePlayer
        guard let gameState = gameState else { return }
        self.gameState = gameState
    }
    
    //=======================
    // MARK: - Properties
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool {
        switch gameState {
        case .won(_):
            return true
        case .cat:
            return true
        case .active(_):
            return false
        }
    }
    
    private var gameState = GameState.active(.x) {
        didSet {
            
        }
    }
    internal var winningPlayer: GameBoard.Mark?
    
    //=======================
    // MARK: - Change Game State
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        gameState = .active(activePlayer!) //set earlier in this block
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        do {
            try board.place(mark: activePlayer ?? .x, on: coordinate)
            isGameWon()
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
            winningPlayer = activePlayer
            return true
        }
        
        return false
    }
    
}
