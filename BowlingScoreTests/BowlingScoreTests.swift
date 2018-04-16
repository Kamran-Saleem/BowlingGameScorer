//
//  BowlingScoreTests.swift
//  BowlingScoreTests
//
//  Created by Kamran Saleem Soomro on 16/04/2018.
//  Copyright © 2018 Kamran Saleem Soomro. All rights reserved.
//

import XCTest
@testable import BowlingScore

class BowlingScoreTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUpcomingFrameNumer() {
        let automaticBowlingScorer = AutomaticBowlingScorer()
        let frameNumber0 = automaticBowlingScorer.frameNumber()
        XCTAssertEqual(frameNumber0, 0)
        
        automaticBowlingScorer.roll(frameScore: [3,4])
        let frameNumber1 = automaticBowlingScorer.frameNumber()
        XCTAssertEqual(frameNumber1, 1)
        
        automaticBowlingScorer.roll(frameScore: [3,4])
        let frameNumber2 = automaticBowlingScorer.frameNumber()
        XCTAssertEqual(frameNumber2, 2)
        
    }
    
    func testGameIsOver() {
        let automaticBowlingScorer = AutomaticBowlingScorer()
        automaticBowlingScorer.roll(frameScore: [3,4])
        let isGameOver = automaticBowlingScorer.gameIsOver()
        XCTAssertFalse(isGameOver)
    }
    
    func testScoreSoFar() {
        let automaticBowlingScorer = AutomaticBowlingScorer()
        //Frame 1
        automaticBowlingScorer.roll(frameScore: [9,1])
        let scoreSoFar = automaticBowlingScorer.scoreSoFar()
        XCTAssertEqual(scoreSoFar, 10)
        
        //Frame 2
        automaticBowlingScorer.roll(frameScore: [0,10])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 20)
        // Frame 3
        automaticBowlingScorer.roll(frameScore: [10,0])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 40)
        // Frame 4
        automaticBowlingScorer.roll(frameScore: [10,0])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 60)
        // Frame 5
        automaticBowlingScorer.roll(frameScore: [6,2])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 82)
        // Frame 6
        automaticBowlingScorer.roll(frameScore: [7,3])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 92)
        // Frame 7
        automaticBowlingScorer.roll(frameScore: [8,2])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 110)
        // Frame 8
        automaticBowlingScorer.roll(frameScore: [10,0])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 130)
        // Frame 9
        automaticBowlingScorer.roll(frameScore: [9,0])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 148)
        // Frame 10
        automaticBowlingScorer.roll(frameScore: [10,0,10,8])
        XCTAssertEqual(automaticBowlingScorer.scoreSoFar(), 176)
        
        let isGameOver = automaticBowlingScorer.gameIsOver()
        XCTAssertTrue(isGameOver)
    }
    
    func testCommulativeScoreForEachFrame() {
        
    }
    
}
