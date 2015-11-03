//
//  GameScene.swift
//  Balling Falls
//
//  Created by Aaron Wong on 10/27/15.
//  Copyright (c) 2015 Aaron Wong. All rights reserved.
//

import SpriteKit

var ballsNum = 1

class GameScene: SKScene {
    var balls: [SKShapeNode] = []
    let player: Player = Player()
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        let borderBody = SKPhysicsBody(edgeLoopFromRect: CGRect(x: 0, y: 0, width: self.frame.size.width + 300, height: self.frame.size.height))
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        self.addBall()
        self.addPlayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        for ball in balls {
            if ball.position.x >= 1100 {
                self.removeBall(balls.indexOf(ball)!)
            }
        }
    }
    
    func addBall() {
        let ball = SKShapeNode(circleOfRadius: 20)
        ball.strokeColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        ball.lineWidth = 4
        self.addChild(ball)
        
        ball.position = CGPoint(x: 0, y: 510)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.frame.size.width/2)
        ball.physicsBody!.friction = 0
        ball.physicsBody!.restitution = 1
        ball.physicsBody!.linearDamping = 0.1
        ball.physicsBody!.angularDamping = 0
        ball.physicsBody!.applyImpulse(CGVectorMake(100, -10))
        
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