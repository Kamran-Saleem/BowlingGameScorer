//
//  AutomaticBowlingScorer.swift
//  BowlingScore
//
//  Created by Kamran Saleem Soomro on 16/04/2018.
//  Copyright © 2018 Kamran Saleem Soomro. All rights reserved.
//

import Foundation

public class AutomaticBowlingScorer {
    
    private var frameIndex = 0
    private var scoreForEachFrame = [[Int]]()
    private var cummulativeScoreForEachFrame = [Int]()
    private var cummulativeScoreSoFar = 0
    
    init() {
        
    }
    
    // returns next frame number
    public func frameNumber() -> Int {
            return frameIndex
    }
    
    // return cummulative score so far
    public func scoreSoFar() -> Int {
        var totalScore = 0
        for score in cummulativeScoreForEachFrame {
            totalScore += score
        }
        return totalScore
    }
    
    public func gameIsOver() -> Bool {
        return frameIndex > 9
    }
    
    // take input for each throw (roll) and
    // returns array of cummulative score for each frame
    public func roll(frameScore: [Int]) -> [Int] {
        if gameIsOver() {
            print("Game is Over")
            return cummulativeScoreForEachFrame
        }
        else if frameIndex == 9 {
            print("Last frame")
            scoreForEachFrame.append(frameScore)
            calculateLastFrameScore()
            calculatePreviousFrameScore()
        }
        else {
            scoreForEachFrame.append(frameScore)
            calculateCurrentFrameScore()
            calculatePreviousFrameScore()
        }
        frameIndex += 1
        return cummulativeScoreForEachFrame
    }
    
    private func calculateCurrentFrameScore() {
        cummulativeScoreForEachFrame.append(scoreForEachFrame[frameIndex].first! + scoreForEachFrame[frameIndex].last!)
    }
    
    private func calculatePreviousFrameScore() {
        if frameIndex > 0 {
            if isLastFrameStrike() {
                if frameIndex > 1 {
                    if isSecondLastFrameStrike() {
                        let secondLastFrameScore = 10 + 10 + getCurrentFrameFirstBallScore()
                        setSecondLastFrameTotalScore(score: secondLastFrameScore)
                    }
                }
                print("Last frame is strike")
                let lastFrameScore = 10 + getCurrentFrameTotalScore()
                setLastFrameTotalScore(score: lastFrameScore)
            }
            else if isLastFrameSpare() {
                print("Last frame is spare")
                let lastFrameScore = 10 + getCurrentFrameFirstBallScore()
                setLastFrameTotalScore(score: lastFrameScore)
            }
        }
    }
    
    private func calculateLastFrameScore() {
        var lastFrameScore = 0
        for score in scoreForEachFrame[frameIndex] {
            lastFrameScore += score
        }
        cummulativeScoreForEachFrame.append(lastFrameScore)
    }
    
    // Helper func
    
    private func getCurrentFrameTotalScore() -> Int {
        return cummulativeScoreForEachFrame[frameIndex]
    }
    
    private func getCurrentFrameFirstBallScore() -> Int {
        return scoreForEachFrame[frameIndex].first!
    }
    
    private func getLastFrameTotalScore() -> Int {
        return cummulativeScoreForEachFrame[frameIndex-1]
    }
    
    private func getLastFrameScore() -> [Int] {
        return scoreForEachFrame[frameIndex-1]
    }
    
    private func getSecondLastFrameScore() -> [Int] {
        return scoreForEachFrame[frameIndex-2]
    }
    
    private func setLastFrameTotalScore(score: Int) {
        cummulativeScoreForEachFrame[frameIndex-1] = score
    }
    
    private func setSecondLastFrameTotalScore(score: Int) {
        cummulativeScoreForEachFrame[frameIndex-2] = score
    }
    
    private func isLastFrameStrike() -> Bool {
        return getLastFrameScore().first == 10
    }
    
    private func isSecondLastFrameStrike() -> Bool {
        return getSecondLastFrameScore().first == 10
    }
    
    private func isLastFrameSpare() -> Bool {
        let lastscore = getLastFrameScore()
        return (lastscore.first! + lastscore.last!) == 10
    }
    
}
