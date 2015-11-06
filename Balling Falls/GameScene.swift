//
//  GameScene.swift
//  Balling Falls
//
//  Created by Aaron Wong on 10/27/15.
//  Copyright (c) 2015 Aaron Wong. All rights reserved.
//

import SpriteKit
import CoreMotion
import Foundation

let colliderTypePlayer = UInt32(2)
let colliderTypeWall = UInt32(1)
let colliderTypeBall = UInt32(0)

let motionManager: CMMotionManager = CMMotionManager()

class GameScene: SKScene {
    var balls: [SKShapeNode] = []
    let player: Player = Player(width: 50, height: 150)
    let tilt: Double = 0.1
    let velocity: CGFloat = 1000.0
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        motionManager.startAccelerometerUpdates()
        
        let frameEdge = CGRect(x: 0, y: 0, width: self.frame.size.width + 300, height: self.frame.size.height)
        let borderBody = SKPhysicsBody(edgeLoopFromRect: frameEdge)
        borderBody.friction = 0
        borderBody.categoryBitMask = colliderTypeWall
        self.physicsBody = borderBody
        
        self.addBall()
        self.addPlayer()
        
        // name this to turn off
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("addBall"), userInfo: nil, repeats: true)
    }
   
    override func update(currentTime: CFTimeInterval) {
        processUserMotionForUpdate(currentTime)
        
        for ball in balls {
            if ball.position.x >= 1100 {
                self.removeBall(balls.indexOf(ball)!)
                self.addBall()
            }
        }
    }
    
    func processUserMotionForUpdate(currentTime: CFTimeInterval) {
        if let data = motionManager.accelerometerData {
            if (fabs(data.acceleration.y) > tilt * 2 && abs(Int(player.physicsBody!.velocity.dx)) < 700) {
                let direction = CGFloat(data.acceleration.y / fabs(data.acceleration.y))
                player.physicsBody!.applyForce(CGVectorMake(100.0 * direction, 0))
            } else if (abs(Int(player.physicsBody!.velocity.dx)) > 0) {
                player.physicsBody!.applyForce(CGVectorMake(-player.physicsBody!.velocity.dx / 2, 0))
            }
        }
    }
    
    func addBall() {
        let randomRadius = CGFloat(arc4random_uniform(25)) + 10
        
        let ball = Ball(circleOfRadius: randomRadius)
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
    }
}