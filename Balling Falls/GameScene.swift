//
//  GameScene.swift
//  Balling Falls
//
//  Created by Aaron Wong on 10/27/15.
//  Copyright (c) 2015 Aaron Wong. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var balls: [SKShapeNode] = []
    let player: Player = Player()
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        let frameEdge = CGRect(x: 0, y: 0, width: self.frame.size.width + 300, height: self.frame.size.height)
        let borderBody = SKPhysicsBody(edgeLoopFromRect: frameEdge)
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
                self.addBall()
            }
        }
    }
    
    func addBall() {
        let randomHeight = Int(arc4random_uniform(100)) + 500
        let randomRadius = CGFloat(arc4random_uniform(25)) + 10
        let randomXVelocity = CGFloat(arc4random_uniform(40)) + 10
        
        let ball = SKShapeNode(circleOfRadius: randomRadius)
        ball.strokeColor = UIColor(red: self.randomRGB(), green: self.randomRGB(), blue: self.randomRGB(), alpha: 1)
        print(self.randomRGB())
        ball.lineWidth = 4
        self.addChild(ball)
        
        ball.position = CGPoint(x: 0, y: randomHeight)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.frame.size.width/2)
        ball.physicsBody!.friction = 0
        ball.physicsBody!.restitution = 1
        ball.physicsBody!.linearDamping = 0.01
        ball.physicsBody!.angularDamping = 0
        ball.physicsBody!.applyImpulse(CGVectorMake(randomXVelocity, -10))
        
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
    
    func randomRGB() -> CGFloat {
        return CGFloat(drand48())
    }
}