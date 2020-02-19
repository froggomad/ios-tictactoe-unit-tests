//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Kenny on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    //=======================
    // MARK: - Test isEmpty implementation
    func testBoardIsEmptyAtStart() {
        let board = GameBoard()
        XCTAssertTrue(board.isEmpty == true)
    }
    
    func testBoardIsNotEmptyAfterMove() {
        var board = GameBoard()
        try! board.place(mark: .o, on: (0,0))
        XCTAssertTrue(board.isEmpty == false)
    }
    
    //=======================
    // MARK: - test game state after restart
    func testBoardIsEmptyAfterRestart() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        var game = Game(board: board, activePlayer: .o, gameIsOver: false)
        game.restart()
        XCTAssertTrue(game.board.isEmpty == true)
    }
    
    func testActivePlayerAfterRestart() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: false)
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
    }
    
    func testGameNotOverAfterRestart() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: true)
        game.restart()
        XCTAssertTrue(game.gameIsOver == false)
    }
    
    func testNoWinningPlayerAfterRestart() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: true, winningPlayer: .o)
        game.restart()
        XCTAssertTrue(game.winningPlayer == nil)
    }
    
}
