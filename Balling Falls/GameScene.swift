//
//  GameScene.swift
//  Balling Falls
//
//  Created by Aaron Wong and Derek Chan on 10/27/15.
//  Copyright (c) 2015 Aaron Wong and Derek Chan. All rights reserved.
//

import UIKit
import SpriteKit
import CoreMotion
import Foundation

let colliderTypeRoadBlock = UInt32(3)
let colliderTypePlayer = UInt32(2)
let colliderTypeWall = UInt32(1)
let colliderTypeBall = UInt32(0)
var playerPosition: CGPoint?

let motionManager: CMMotionManager = CMMotionManager()

class GameScene: SKScene, SKPhysicsContactDelegate {
    var balls: [SKShapeNode] = []
    var player: Player!
    let tilt: Double = 0.1
    let velocity: CGFloat = 100.0
    var timer: NSTimer?
    var isGameOver = false
    
    var score: Int = 0
    var scoreText: SKLabelNode!
    
    var playAgainGameButton: GameButton!
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        self.backgroundColor = SKColor.whiteColor()
        
        motionManager.startAccelerometerUpdates()
        self.physicsWorld.contactDelegate = self
        
        let frameEdge = CGRect(x: -20, y: 20, width: self.frame.size.width + 300, height: self.frame.size.height)
        let borderBody = SKPhysicsBody(edgeLoopFromRect: frameEdge)
        borderBody.friction = 0
        borderBody.categoryBitMask = colliderTypeWall
        self.physicsBody = borderBody
        
        self.startGame()
//        self.addRightRoadBlock()
    }
    
    func startGame() {
        isGameOver = false
        
        if scoreText != nil {
            scoreText.removeFromParent()
        }
        
        if playAgainGameButton != nil {
            playAgainGameButton.removeFromParent()
        }
        
        for ball in balls {
            self.removeBall(balls.indexOf(ball)!)
        }
        
        player = Player()
        scoreText = SKLabelNode(fontNamed: "IndieFlower")
        scoreText.fontSize = 30
        scoreText.fontColor = SKColor.blackColor()
        scoreText.text = "Score: \(score)"
        scoreText.position = CGPoint(x: size.width - 130, y: size.height - 90)
        self.addChild(scoreText)
        
        self.addBall()
        self.addPlayer()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("addBall"), userInfo: nil, repeats: true)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        self.removePlayer()
    }
    
    func removePlayer() {
        isGameOver = true

        playerPosition = player.position
        player?.removeFromParent()
        
        for _ in 0...score/10 {
            self.addBall()
        }
        
        self.gameOver()
    }
    
    override func update(currentTime: CFTimeInterval) {
        self.processUserMotionForUpdate(currentTime)

        for ball in balls {
            if ball.position.x >= 1100 {
                self.removeBall(balls.indexOf(ball)!)
                if (!isGameOver) {
                    self.addBall()
                    score += 10
                    scoreText.text = "Score: \(score)"
                }
            }
        }
    }
    
    func processUserMotionForUpdate(currentTime: CFTimeInterval) {
        if let data = motionManager.accelerometerData {
            if (fabs(data.acceleration.y) > tilt * 2 && abs(Int(player.physicsBody!.velocity.dx)) < 700) {
                let direction = CGFloat(data.acceleration.y / fabs(data.acceleration.y))
                player.physicsBody!.applyForce(CGVectorMake(velocity * direction, 0))
            } else if (abs(Int(player.physicsBody!.velocity.dx)) > 0) {
                player.physicsBody!.applyForce(CGVectorMake(-player.physicsBody!.velocity.dx / 2, 0))
            }
        }
    }
    
    func addBall() {
        let ball = Ball(gameOver: isGameOver)
        self.addChild(ball)
        ball.addPhysics()
        balls.append(ball)
    }
    
    func removeBall(index: Int) {
        balls[index].removeFromParent()
        balls.removeAtIndex(index)
    }
    
    func addPlayer() {
        player.position = CGPoint(x: CGRectGetMidX(self.frame), y: 50)
        self.addChild(player)
        player.addPhysics()
//        player.standing()
    }
    
    func addRightRoadBlock() {
        let rightBlock = RoadBlock(position: CGPoint(x: 500, y: 0))
        self.addChild(rightBlock)
        rightBlock.addPhysics()
    }
    
    func gameOver() {
        timer?.invalidate()
        timer = nil
        score = 0
        self.showGameOverScreen()
    }
    
    func showGameOverScreen() {
        playAgainGameButton = GameButton(defaultButtonImage: "playAgainButton", activeButtonImage: "playAgainButton", buttonAction: startGame)
        playAgainGameButton.position = CGPointMake(self.frame.width / 2, self.frame.height / 2)
        self.addChild(playAgainGameButton)
    }
}