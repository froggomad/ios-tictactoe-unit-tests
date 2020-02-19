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
    
    func testBoardIsEmptyAfterRestart() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .o, gameIsOver: true)
        game.restart()
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertTrue(game.gameIsOver == false)
    }
    
}
