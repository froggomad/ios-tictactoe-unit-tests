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
    // MARK: - Test board isEmpty implementation (other tests rely on this implementation)
    func testBoardIsEmptyAtStart() {
        let board = GameBoard()
        XCTAssertTrue(board.isEmpty)
    }
    
    func testBoardIsNotEmptyAfterMove() {
        var board = GameBoard()
        try! board.place(mark: .o, on: (0,0))
        XCTAssertFalse(board.isEmpty)
    }
    
    //=======================
    // MARK: - test game state after restart
    func testBoardIsEmptyAfterRestart() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        var game = Game(board: board, activePlayer: .o)
        game.restart()
        XCTAssertTrue(game.board.isEmpty)
    }
    
    func testActivePlayerAfterRestart() {
        var game = Game(activePlayer: .o)
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
    }
    
    func testGameNotOverAfterRestart() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameState: .cat)
        game.restart()
        XCTAssertFalse(game.gameIsOver)
    }
    
    func testNoWinningPlayerAfterRestart() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameState: .won(.x))
        game.restart()
        XCTAssertTrue(game.winningPlayer == nil)
    }
    
    //=======================
    // MARK: - test makeMark
    func testMakeMarkIsPlacingMarkAtProperCoordinate() {
        var game = Game(activePlayer: .o)
        try! game.makeMark(at: (x:0,y:0))
        XCTAssertTrue(game.board[(x:0,y:0)] == .o)
    }
    
    func testMakeMarkIsUpdatingWinningPlayer() {
        var game = Game(activePlayer: .o)
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (2,2))
        XCTAssertTrue(game.winningPlayer == .o)
    }
    
    
    
}
