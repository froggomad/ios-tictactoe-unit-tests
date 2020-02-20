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
        var game = Game(board: board, activePlayer: .o, gameIsOver: false)
        game.restart()
        XCTAssertTrue(game.board.isEmpty)
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
        XCTAssertFalse(game.gameIsOver)
    }
    
    func testNoWinningPlayerAfterRestart() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: true, winningPlayer: .o)
        game.restart()
        XCTAssertTrue(game.winningPlayer == nil)
    }
    
    //=======================
    // MARK: - test makeMark
    func testMakeMarkIsPlacingMarkAtProperCoordinate() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: true, winningPlayer: .o)
        try! game.makeMark(at: (x:0,y:0))
        XCTAssertTrue(game.board[(x:0,y:0)] != nil)
    }
    
    func testMakeMarkIsUpdatingWinningPlayer() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: true)
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (2,2))
        XCTAssertTrue(game.winningPlayer == .o)
    }
    
    
    
}
